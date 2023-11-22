from .models import *
from admin.organ.models import *
from rest_framework import status
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
            response = {'status': 403, 'message': 'Error in storing Body Part data'}
            return Response(response, status=status.HTTP_403_FORBIDDEN)
    else:
        response = {'status': 400, 'message ': 'HTTP_400_BAD_REQUEST.', 'errors': serializer.errors}
        return Response(response, status=status.HTTP_400_BAD_REQUEST)


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
            response = {'status': 403, 'message': 'Error in updated Body Part data'}
            return Response(response, status=status.HTTP_403_FORBIDDEN)
    else:
        response = {'status': 400, 'message ': 'HTTP_400_BAD_REQUEST.', 'errors': serializer.errors}
        return Response(response, status=status.HTTP_400_BAD_REQUEST)


# body_part delete function
@api_view(['PUT', 'GET'])
def delete_body_part_data(request, body_part_id):
    try:
        body_part = BodyPart.objects.get(id=body_part_id)
    except BodyPart.DoesNotExist:
        response = {'status': 404, 'message': 'Body Part not found'}
        return Response(response, status=status.HTTP_404_NOT_FOUND)

    organs = Organ.objects.filter(body_part_id=body_part_id)

    if organs.exists():
        response = {'status': 403, 'message': 'Body Part cannot be deleted because it is associated with Organ table.'}
        return Response(response, status=status.HTTP_403_FORBIDDEN)
    else:
        serializer = BodyPartSerializer(body_part, data={'deleted_at': timezone.now()}, partial=True)

        if serializer.is_valid():
            serializer.save()
            return Response({'status': 200, 'message': 'Body Part data deleted successfully'})
        else:
            response = {'status': 400, 'message': 'Bad Request', 'errors': serializer.errors}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
