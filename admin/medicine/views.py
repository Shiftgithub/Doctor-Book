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
            return Response({'status': 200})
    else:
        return Response({'status': 403})


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
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# medicine delete function
@api_view(['PUT', 'GET'])
def softdelete_medicine_data(request, medicine_id):
    medicine = Medicine.objects.get(id=medicine_id)
    serializer = MedicineDeleteSerializer(medicine, data=request.data)
    if serializer.is_valid():
        if serializer.save(deleted_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


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
