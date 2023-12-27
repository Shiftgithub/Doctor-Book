from .models import *
from admin.organ.models import *
from django.utils import timezone
from admin.bodypart.serializers import *
from rest_framework.response import Response
from rest_framework.decorators import api_view


# store body_part function
@api_view(['POST'])
def store_body_part_data(request):
    serializer = BodyPartSerializer(data=request.data)
    if serializer.is_valid():
        if serializer.save():
            return Response({'status': 200, 'message': 'Body Part data stored Successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in storing Body Part data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


# all body_part list function
@api_view(['GET'])
def get_all_body_part_list(request):
    body_parts = BodyPart.objects.filter(deleted_at=None).order_by('id')
    serializer = BodyPartSerializer(body_parts, many=True)
    return Response(serializer.data)


#  body_part data show using id function
@api_view(['GET'])
def get_body_part_data(request, body_part_id):
    body_part = BodyPart.objects.get(id=body_part_id)
    serializer = BodyPartSerializer(body_part, many=False)
    return Response(serializer.data)


# body_part edit function
@api_view(['PUT', 'POST'])
def edit_body_part_data(request, body_part_id):
    body_part = BodyPart.objects.get(id=body_part_id)
    serializer = BodyPartSerializer(body_part, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200, 'message': 'Body Part data updated Successfully'})
        else:
            return Response({'status': 403, 'message': 'Error in updated Body Part data'})
    else:
        return Response({'status': 400, 'message': 'Invalid request!'})


# body_part delete function
@api_view(['PUT', 'GET'])
def delete_body_part_data(request, body_part_id):
    try:
        body_part = BodyPart.objects.get(id=body_part_id)
    except BodyPart.DoesNotExist:
        response = {'status': 404, 'message': 'Body Part not found'}
        return Response(response)

    organs = Organ.objects.filter(body_part_id=body_part_id)

    if organs.exists():
        return Response(
            {'status': 403, 'message': 'Body Part cannot be deleted because it is associated with Organ table.'})
    else:
        serializer = BodyPartSerializer(body_part, data={'deleted_at': timezone.now()}, partial=True)

        if serializer.is_valid():
            if serializer.save():
                return Response({'status': 200, 'message': 'Body Part data deleted successfully'})
            else:
                return Response({'status': 403, 'message': 'Error in body part deleting data'})
        else:
            return Response({'status': 400, 'message': 'Invalid Request'})
