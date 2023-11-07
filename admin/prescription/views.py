from .models import *
from .serializers import *
from django.db import transaction
from django.utils import timezone
from admin.medicine.models import Medicine
from rest_framework.response import Response
from rest_framework.decorators import api_view


@api_view(['POST'])
def store_prescription_data(request, doctor_id, user_id):
    prescription_serializer = PrescriptionSerializer(data=request.data)
    labtest_serializer = PrescriptionLabTestSerializer(data=request.data)
    prescription_medicine_serializer = PrescriptionMedicineSerializer(data=request.data)
    with transaction.atomic():
        if (
                prescription_serializer.is_valid() and
                labtest_serializer.is_valid() and
                prescription_medicine_serializer.is_valid()
        ):
            user_instant = User.objects.get(id=user_id)
            doctor_instant = DoctorProfile.objects.get(id=doctor_id)
            prescription_instance = prescription_serializer.save(created_by=user_instant,
                                                                 doctor_profile=doctor_instant)
            print(prescription_instance)
            # Get the lists of values from the request data
            lab_test_ids = request.data.getlist('lab_test[]')
            medicine_ids = request.data.getlist('medicine[]')
            medicine_schedule_ids = request.data.getlist('medicine_schedule[]')
            frequencys = request.data.getlist('frequency[]')
            durations = request.data.getlist('duration[]')

            # Create PrescriptionMedicine and PrescriptionLabTest objects
            for lab_test_id, medicine_id, medicine_schedule_id, frequency, duration in zip(
                    lab_test_ids, medicine_ids, medicine_schedule_ids, frequencys, durations
            ):
                # Create PrescriptionMedicine instance
                prescription_medicine = PrescriptionMedicine.objects.create(
                    prescription=prescription_instance,
                    medicine_id=medicine_id,
                    medicine_schedule_id=medicine_schedule_id,
                    frequency=frequency,
                    duration=duration
                )
                # Create PrescriptionLabTest instance
                prescription_labtest = PrescriptionLabTest.objects.create(
                    prescription=prescription_instance,
                    lab_test_id=lab_test_id
                )
            if prescription_medicine and prescription_labtest:
                return Response({'status': 200})
            else:
                transaction.set_rollback(True)
                return Response({'status': 404})
        else:
            transaction.set_rollback(True)
            return Response({'status': 400, 'message': 'Invalid data', 'id': doctor_id})


@api_view(['GET'])
def get_all_prescriptions_list(request):
    prescriptions = Prescription.objects.filter(deleted_at=None).prefetch_related(
        'prescription_medicine', 'prescription_lab'
    ).order_by('id')

    if prescriptions.exists():  # Check if there are any prescriptions
        serializer = PrescriptionViewSerializer(instance=prescriptions, many=True)
        serializer_data = serializer.data
        return Response(serializer_data)
    else:
        return Response({"detail": "No prescriptions found"}, status=404)


@api_view(['GET'])
def prescription_dataview(request, prescription_id):
    try:
        prescription = Prescription.objects.filter(id=prescription_id, deleted_at=None).prefetch_related(
            'prescription_medicine', 'prescription_lab',
        ).get()
        serializer_data = PrescriptionViewSerializer(instance=prescription).data
        print(serializer_data)
        return Response(serializer_data)
    except Prescription.DoesNotExist:
        return Response({"detail": "Prescription not found"}, status=404)


# prescription edit function
@api_view(['PUT', 'POST'])
def edit_prescription_data(request, prescription_id):
    prescription = Prescription.objects.get(id=prescription_id)
    serializer = PrescriptionSerializer(prescription, data=request.data)

    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# prescription delete function
@api_view(['PUT', 'GET'])
def softdelete_prescription_data(request, prescription_id):
    prescription = Prescription.objects.get(id=prescription_id)
    serializer = PrescriptionDeleteSerializer(prescription, data=request.data)

    if serializer.is_valid():
        if serializer.save(deleted_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def medicine_schedule_list(request):
    medicine_schedule = MedicineSchedule.objects.all()
    serializer = MedicineScheduleSerializer(medicine_schedule, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def lab_test_list(request):
    lab_test = LabTest.objects.all()
    serializer = LabTestSerializer(lab_test, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)
