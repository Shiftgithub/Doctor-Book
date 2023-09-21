from .models import *
from .serializers import *
from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view


@api_view(['POST'])
def store_prescription_data(request):
    prescription_serializer = PrescriptionSerializer(data=request.data)
    if prescription_serializer.is_valid():
        if prescription_serializer.save():
            return Response({'status': 200})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_prescriptions_list(request):
    prescriptions = Prescription.objects.filter(deleted_at=None).order_by('id')
    serializer = PrescriptionSerializer(prescriptions, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def prescription_dataview(request, prescription_id):
    prescription = Prescription.objects.get(id=prescription_id)

    serializer = PrescriptionSerializer(instance=prescription)

    return Response(serializer.data)


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
