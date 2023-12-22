from .models import *
from .serializers import *
from django.db import transaction
from rest_framework.response import Response
from rest_framework.decorators import api_view

# import for barcode
import os
import hashlib
import barcode
from io import BytesIO
from PIL import Image
from barcode.writer import ImageWriter


@api_view(['POST'])
@transaction.atomic
def store_prescription_data(request, doctor_id, user_id):
    medicine_serializer = PrescriptionForMedicineSerializer(data=request.data)
    prescription_serializer = MedicinePrescriptionSerializer(data=request.data)

    if medicine_serializer.is_valid() and prescription_serializer.is_valid():
        user_instant = User.objects.get(id=user_id)
        doctor_instant = DoctorProfile.objects.get(id=doctor_id)
        medicine_instance = medicine_serializer.save(created_by=user_instant, doctor_profile=doctor_instant)

        # Get the lists of values from the request data
        medicine_ids = request.data.getlist('medicine[]')
        medicine_schedule_ids = request.data.getlist('medicine_schedule[]')
        frequencies = request.data.getlist('frequency[]')
        durations = request.data.getlist('duration[]')

        # Create PrescriptionMedicine and PrescriptionLabTest objects
        for medicine_id, medicine_schedule_id, frequency, duration in zip(
                medicine_ids, medicine_schedule_ids, frequencies, durations
        ):
            # Create PrescriptionMedicine instance
            medicine_prescription = MedicinePrescription.objects.create(
                prescription=medicine_instance,
                medicine_id=medicine_id,
                medicine_schedule_id=medicine_schedule_id,
                frequency=frequency,
                duration=duration,
                created_by=user_instant,
            )
        if medicine_prescription:
            return Response({'status': 200, 'message': 'Medicine Prescription data stored successfully'})
        else:
            transaction.set_rollback(True)
            return Response({'status': 403, 'message': 'Error in storing medicine prescription data'})
    else:
        transaction.set_rollback(True)
        return Response({'status': 400, 'message': 'Invalid data', 'id': doctor_id})


@api_view(['GET'])
def get_all_medicine_prescriptions_list(request):
    user_id = request.session.get('user_id')
    doctor_profile = DoctorProfile.objects.filter(user_id=user_id).first()
    doctor_id = doctor_profile.id
    medicines = PrescriptionForMedicine.objects.filter(deleted_at=None, doctor_profile=doctor_id).prefetch_related(
        'medicine_prescription').order_by('-id')
    serializer = PrescriptionForMedicineViewSerializer(instance=medicines, many=True)
    serializer_data = serializer.data

    return Response(serializer_data)


@api_view(['GET'])
def get_medicine_prescription_by_id(request, prescription_id):
    medicine = PrescriptionForMedicine.objects.filter(id=prescription_id, deleted_at=None).prefetch_related(
        'medicine_prescription').get()
    serializer_data = PrescriptionForMedicineViewSerializer(instance=medicine).data
    registration_data_to_encode = str(serializer_data.get('registration_no', ''))
    barcode_image_path = generate_barcode(request, registration_data_to_encode)

    # Add barcode_image_path to serializer_data
    serializer_data['barcode_image'] = barcode_image_path

    return Response(serializer_data)


# lab test part
@api_view(['POST'])
@transaction.atomic
def store_lab_prescription_data(request, doctor_id, user_id):
    lab_test_serializer = PrescriptionForLabTestSerializer(data=request.data)
    prescription_serializer = LabTestPrescriptionSerializer(data=request.data)

    if lab_test_serializer.is_valid() and prescription_serializer.is_valid():
        user_instant = User.objects.get(id=user_id)
        doctor_instant = DoctorProfile.objects.get(id=doctor_id)
        prescription_instance = lab_test_serializer.save(created_by=user_instant, doctor_profile=doctor_instant)

        # Get the lists of values from the request data
        lab_test_ids = request.data.getlist('lab_test[]')

        # Create PrescriptionMedicine and PrescriptionLabTest objects
        for lab_test_id, in zip(lab_test_ids):
            # Create PrescriptionLabTest instance
            prescription_lab_test = LabTestPrescription.objects.create(
                lab_prescription=prescription_instance,
                lab_test_id=lab_test_id,
                created_by=user_instant,
            )
        if prescription_lab_test:
            return Response({'status': 200, 'message': 'Lab Prescription data stored successfully'})
        else:
            transaction.set_rollback(True)
            return Response({'status': 403, 'message': 'Error in storing lab prescription data'})
    else:
        transaction.set_rollback(True)
        return Response({'status': 400, 'message': 'Invalid data', 'id': doctor_id})


@api_view(['GET'])
def get_all_lab_test_prescriptions_list(request):
    lab_tests = PrescriptionForLabTest.objects.filter(deleted_at=None).prefetch_related(
        'prescription_lab').order_by('-id')
    serializer_data = PrescriptionForLabTestViewSerializer(instance=lab_tests, many=True).data
    return Response(serializer_data)


@api_view(['GET'])
def get_lab_prescription_by_id(request, prescription_id):
    lab = PrescriptionForLabTest.objects.filter(id=prescription_id, deleted_at=None).prefetch_related(
        'prescription_lab', ).get()
    serializer_data = PrescriptionForLabTestViewSerializer(instance=lab).data
    registration_data_to_encode = str(serializer_data.get('registration_no', ''))
    barcode_image_path = generate_barcode(request, registration_data_to_encode)

    # Add barcode_image_path to serializer_data
    serializer_data['barcode_image'] = barcode_image_path

    return Response(serializer_data)


@api_view(['GET'])
def count_medicine_prescription(request, doctor_id):
    # Get the PrescriptionForMedicine instances for the given doctor_id
    prescriptions_for_medicine = PrescriptionForMedicine.objects.filter(doctor_profile=doctor_id)

    # Get the count of prescriptions_for_medicine
    prescriptions_for_medicine_count = prescriptions_for_medicine.count()
    serialized_data = {'prescriptions_for_medicine_count': prescriptions_for_medicine_count}

    return Response(serialized_data)


@api_view(['GET'])
def count_lab_prescription(request, doctor_id):
    # Get the PrescriptionForLabTest instances for the given doctor_id
    prescriptions_for_lab = PrescriptionForLabTest.objects.filter(doctor_profile=doctor_id)

    # Get the count of lab_prescription
    prescriptions_for_lab_count = prescriptions_for_lab.count()

    # Serializing lab_prescription_count
    serialized_data = {'prescriptions_for_lab_count': prescriptions_for_lab_count}

    return Response(serialized_data)


def generate_barcode(request, registration):
    # Encrypt the registration string (you can use a stronger encryption method)
    encrypted_registration = hashlib.sha256(registration.encode()).hexdigest()

    # Limit the length to 8 characters
    truncated_encrypted_registration = encrypted_registration[:8]

    # Generate barcode
    code = barcode.get('code128', registration, writer=ImageWriter())

    # Create a BytesIO buffer to store the image data
    buffer = BytesIO()

    # Write the barcode to the buffer
    code.write(buffer, options={'write_text': False})

    # Reset the buffer position to the beginning
    buffer.seek(0)

    # Create a PIL Image from the barcode
    pil_image = Image.open(buffer)

    # Define the directory where you want to save the barcode image
    barcode_image_directory = 'static/uploads/barcodes/'

    # Create the directory if it does not exist
    os.makedirs(barcode_image_directory, exist_ok=True)

    # Define the path where you want to save the barcode image with the encrypted registration
    barcode_image_path = os.path.join(barcode_image_directory, '{}.png'.format(truncated_encrypted_registration))

    # Save the PIL Image to the specified path
    pil_image.save(barcode_image_path, format='PNG')

    # Close the BytesIO buffer
    buffer.close()

    # Return the relative path to the generated barcode image without the 'static' prefix
    relative_path = os.path.relpath(barcode_image_path, 'static')
    return relative_path
