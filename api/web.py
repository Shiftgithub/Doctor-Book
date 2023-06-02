from django.shortcuts import render
from . import views

# Message for testing
from django.contrib import messages


def Dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')


def DepartmentForm(request):
    return render(request, 'app/department/form.html')


def DepartmentDataView(request):
    return render(request, 'app/department/list_all.html')


def DoctorForm(request):
    return render(request, 'app/doctor/form.html')


def DoctorDataView(request):
    return render(request, 'app/doctor/list_all.html')


def BodyPartForm(request):
    return render(request, 'app/body_part/form.html')


# To store
def StoreBodyPart(request):
    operationResponse = views.StoreBodyPartData(request)

    print(operationResponse)

    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Body Part data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Body Part data")

    return render(request, 'app/body_part/form.html')


def BodyPartDataView(request):
    return render(request, 'app/body_part/list_all.html')


def OrganForm(request):
    return render(request, 'app/organ/form.html')


def OrganDataView(request):
    return render(request, 'app/organ/list_all.html')


def OrganProblemForm(request):
    return render(request, 'app/organ_problem/form.html')


def OrganProblemDataView(request):
    return render(request, 'app/organ_problem/list_all.html')


def ProblemSpecificationForm(request):
    return render(request, 'app/problem_specification/form.html')


def ProblemSpecificationDataView(request):
    return render(request, 'app/problem_specification/list_all.html')


def DepartmentSpecificationForm(request):
    return render(request, 'app/department_specification/form.html')

def DepartmentSpecificationDataView(request):
    return render(request, 'app/department_specification/list_all.html')

def GetAdminDashBoard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')

def GetAdminForm(request):
    return render(request, 'admin/form.html')
