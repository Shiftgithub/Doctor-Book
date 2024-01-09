from .models import *
from .serializers import *
from django.utils import timezone
from admin.doctor.models import *
from rest_framework.response import Response
from rest_framework.decorators import api_view


@api_view(['POST'])
def store_medicine_data(request):
    medicine_serializer = MedicineSerializer(data=request.data)
    if medicine_serializer.is_valid():
        if medicine_serializer.save():
            return Response({'status': 200, 'message': 'Medicine data stored successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in storing medicine data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@api_view(['GET'])
def get_all_medicines_list(request):
    medicines = Medicine.objects.filter(deleted_at=None).order_by('id')
    serializer = MedicineViewSerializer(medicines, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def medicine_dataview(request, medicine_id):
    medicine = Medicine.objects.get(id=medicine_id)
    serializer = MedicineViewSerializer(instance=medicine)
    return Response(serializer.data)


# medicine edit function

@api_view(['PUT', 'POST'])
def edit_medicine_data(request, medicine_id):
    medicine = Medicine.objects.get(id=medicine_id)
    serializer = MedicineSerializer(medicine, data=request.data)

    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200, 'message': 'Medicine data updated successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in updating medicine data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


# medicine delete function
@api_view(['PUT', 'GET'])
def softdelete_medicine_data(request, medicine_id):
    medicine = Medicine.objects.get(id=medicine_id)
    serializer = MedicineDeleteSerializer(medicine, data=request.data)
    if serializer.is_valid():
        if serializer.save(deleted_at=timezone.now()):
            return Response({'status': 200, 'message': 'Medicine data deleted successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in  deleting medicine data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


@api_view(['GET'])
def brand_list(request):
    brand = Brand.objects.all()
    serializer = BrandSerializer(brand, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def generic_list(request):
    generic = Generic.objects.all()
    serializer = GenericSerializer(generic, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def medicine_type_list(request):
    medicine_type = MedicineType.objects.all()
    serializer = MedicineTypeSerializer(medicine_type, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def strength_list(request):
    strength = Strength.objects.all()
    serializer = StrengthSerializer(strength, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def medicine_schedule_list(request):
    medicine_schedule = MedicineSchedule.objects.all()
    serializer = MedicineScheduleSerializer(medicine_schedule, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


@api_view(['GET'])
def count_medicine(request):
    # Get the medicine instances for the given doctor_id
    medicine = Medicine.objects.filter(deleted_at=None)

    # Get the count of prescriptions_for_medicine
    medicine_count = medicine.count()
    serialized_data = {'medicine_count': medicine_count}

    return Response(serialized_data)
