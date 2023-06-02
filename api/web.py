from django.shortcuts import render
from . import views

# Message for testing
from django.contrib import messages


def Dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')


def DepartmentForm(request):
    return render(request, 'app/department_form.html')


def DepartmentDataView(request):
    return render(request, 'app/departmentdata.html')


def DoctorForm(request):
    return render(request, 'app/doctor_form.html')


def DoctorDataView(request):
    return render(request, 'app/viewdata.html')


def BodyPartForm(request):
    return render(request, 'app/bodypart_form.html')


# To store
def StoreBodyPart(request):
    operationResponse = views.StoreBodyPartData(request)

    print(operationResponse)

    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Body Part data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Body Part data")

    return render(request, 'app/bodypart_form.html')


def BodyPartDataView(request):
    return render(request, 'app/bodypartdata.html')


def OrganForm(request):
    return render(request, 'app/organ_form.html')


def OrganDataView(request):
    return render(request, 'app/organdata.html')


def OrganProblemForm(request):
    return render(request, 'app/organ_problem_form.html')


def OrganProblemDataView(request):
    return render(request, 'app/organ_problemdata.html')


def ProblemSpecificationForm(request):
    return render(request, 'app/problem_specification_form.html')


def ProblemSpecificationDataView(request):
    return render(request, 'app/problem_specificationdata.html')


def DepartmentSpecificationForm(request):
    return render(request, 'app/departmentspecification_form.html')

def DepartmentSpecificationDataView(request):
    return render(request, 'app/departmentspecificationdata.html')

def GetAdminDashBoard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')

def GetAdminForm(request):
    return render(request, 'admin/form.html')
