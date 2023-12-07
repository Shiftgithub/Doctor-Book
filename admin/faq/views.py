from .serializers import *
from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view


# FAQ
@api_view(['POST'])
def store_faq_data(request, user_id):
    user_instant = User.objects.get(id=user_id)
    faq_serializer = FAQSerializer(data=request.data)
    if faq_serializer.is_valid():
        if faq_serializer.save(created_by=user_instant):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


@api_view(['GET'])
def get_all_faq_list(request):
    faqs = FAQ.objects.filter(deleted_at=None).order_by('-id')

    serialized_data = FAQSerializer(faqs, many=True).data
    return Response(serialized_data)


@api_view(['GET'])
def faq_dataview(request, faq_id):
    # getting bodypart data from faq model ...
    faq = FAQ.objects.get(id=faq_id)

    # serializing faq data ...
    serializer = FAQSerializer(faq, many=False)

    return Response(serializer.data)


# faq edit function

@api_view(['PUT', 'POST'])
def edit_faq_data(request, faq_id, user_id):
    user_instant = User.objects.get(id=user_id)
    faq = FAQ.objects.get(id=faq_id, deleted_at=None)
    serializer = FAQSerializer(faq, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now(), modified_by=user_instant):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# faq delete function
@api_view(['PUT', 'GET'])
def softdelete_faq_data(request, faq_id):
    faq = FAQ.objects.get(id=faq_id)
    serializer = FAQDeleteSerializer(faq, data=request.data)
    if serializer.is_valid():
        if serializer.save(deleted_at=timezone.now()):
            return Response({'status': 200})
        else:
            return Response({'status': 403})
    else:
        return Response({'status': 403})


# for doctor side

@api_view(['GET'])
def get_all_faq_list_created_by(request, user_id):
    faqs = FAQ.objects.filter(created_by=user_id, deleted_at=None)
    serializer = FAQSerializer(faqs, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)
