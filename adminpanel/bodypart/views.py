from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view
from adminpanel.bodypart.serializers import *
from adminpanel.organ.models import *
from adminpanel.bodypart.models import *


# store bodypart function
@api_view(['POST'])
def store_bodypart_data(request):
    bodypart_serializer = BodyPartSerializer(data=request.data)
    if bodypart_serializer.is_valid():
        if bodypart_serializer.save():
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# all bodypart list function
@api_view(['GET'])
def get_all_bodypart_list(request):
    # getting all bodypart data from BodyPart model ...
    bodyparts = BodyPart.objects.filter(deleted_at=None).order_by('id')

    # serializing bodypart data ...
    serializer = BodyPartSerializerView(bodyparts, many=True)

    return Response(serializer.data)


#  bodypart data show using id function

@api_view(['GET'])
def bodypart_dataview(request, bodypart_id):
    # getting bodypart data from BodyPart model ...
    bodypart = BodyPart.objects.get(id=bodypart_id)

    # serializing bodypart data ...
    serializer = BodyPartSerializerView(bodypart, many=False)

    return Response(serializer.data)


# bodypart edit function

@api_view(['PUT', 'POST'])
def edit_bodypart_data(request, bodypart_id):
    bodypart = BodyPart.objects.get(id=bodypart_id)
    serializer = BodyPartSerializer(bodypart, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# bodypart delete function
@api_view(['PUT', 'GET'])
def softdelete_bodypart_data(request, bodypart_id):
    bodypart = BodyPart.objects.get(id=bodypart_id)
    serializer = BodyPartDeleteSerializer(bodypart, data=request.data)
    organs = Organ.objects.filter(body_part_id=bodypart_id)

    if organs:
        return Response({'status': 404})
    else:
        if serializer.is_valid():
            if serializer.save(deleted_at=timezone.now()):
                return Response({'status': 200})
            else:
                return Response({'status': 403})
        else:
            return Response({'status': 403})
