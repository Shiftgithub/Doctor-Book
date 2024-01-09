from .models import *
from .serializers import *
from django.db import transaction
from django.utils import timezone
from rest_framework.response import Response
from rest_framework.decorators import api_view
from admin.prescription.models import LabTestPrescription


# store lab_test function
@api_view(['POST'])
def store_lab_test_data(request):
    serializer = LabTestSerializer(data=request.data)
    if serializer.is_valid():
        if serializer.save():
            return Response({'status': 200, 'message': 'Lab Test data stored Successfully'})
        else:
            response = {'status': 403, 'message': 'Error in storing Lab Test data'}
            return Response(response, status=status.HTTP_403_FORBIDDEN)
    else:
        response = {'status': 400, 'message ': 'HTTP_400_BAD_REQUEST.', 'errors': serializer.errors}
        return Response(response)


# all lab_test list function
@api_view(['GET'])
def get_all_lab_test_list(request):
    lab_test = LabTest.objects.filter(deleted_at=None).order_by('id')
    serializer = LabTestSerializer(lab_test, many=True)
    serialized_data = serializer.data
    return Response(serialized_data)


#  lab_test data show using id function
@api_view(['GET'])
def get_lab_test_data(request, lab_test_id):
    lab_test = LabTest.objects.get(id=lab_test_id)
    serializer = LabTestSerializer(lab_test, many=False)
    return Response(serializer.data)


# lab_test edit function
@api_view(['PUT', 'POST'])
def edit_lab_test_data(request, lab_test_id):
    lab_test = LabTest.objects.get(id=lab_test_id)
    serializer = LabTestSerializer(lab_test, data=request.data)
    if serializer.is_valid():
        if serializer.save(updated_at=timezone.now()):
            return Response({'status': 200, 'message': 'Lab Test data updated Successfully'})
        else:
            response = {'status': 403, 'message': 'Error in updated Lab Test data'}
            return Response(response, status=status.HTTP_403_FORBIDDEN)
    else:
        response = {'status': 400, 'message ': 'HTTP_400_BAD_REQUEST.', 'errors': serializer.errors}
        return Response(response)


# lab_test delete function
@api_view(['PUT', 'GET'])
def delete_lab_test_data(request, lab_test_id):
    try:
        lab_test = LabTest.objects.get(deleted_at=None, id=lab_test_id)
    except LabTest.DoesNotExist:
        response = {'status': 404, 'message': 'Lab Test not found'}
        return Response(response)

    lab_test_prescriptions = LabTestPrescription.objects.filter(lab_test_id=lab_test_id)

    if lab_test_prescriptions.exists():
        response = {'status': 403,
                    'message': 'Lab Test cannot be deleted because it is associated with LabTest Prescription table.'}
        return Response(response)
    else:
        serializer = LabTestSerializer(lab_test, data={'deleted_at': timezone.now()}, partial=True)

        if serializer.is_valid():
            serializer.save()
            return Response({'status': 200, 'message': 'Lab Test data deleted successfully'})
        else:
            response = {'status': 400, 'message': 'Bad Request', 'errors': serializer.errors}
            return Response(response)


@api_view(['GET'])
def count_labtest(request):
    # Get the medicine instances for the given doctor_id
    labtest = LabTest.objects.filter(deleted_at=None)

    # Get the count of labtest
    labtest_count = labtest.count()
    serialized_data = {'labtest_count': labtest_count}

    return Response(serialized_data)
