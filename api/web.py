from django.shortcuts import render
from . import views

# Message for testing
from django.contrib import messages


def Dashboard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')

# department 
def DepartmentForm(request):
    
    return render(request, 'app/department/form.html')

def StoreDepartment(request):
    operationResponse = views.StoreDepartmentData(request)
    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Department data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Department data")

    return render(request, 'app/department/form.html')

def DepartmentDataView(request):
    return render(request, 'app/department/list_all.html')

# Doctor 

def DoctorForm(request):
    return render(request, 'app/doctor/form.html')

def StoreDoctor(request):
    operationResponse = views.StoreDoctorData(request)
    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Doctor data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Doctor data")

    return render(request, 'app/doctor/form.html')

def DoctorDataView(request):
    return render(request, 'app/doctor/list_all.html')


# Body part 

def BodyPartForm(request):
    return render(request, 'app/body_part/form.html')

def StoreBodyPart(request):
    operationResponse = views.StoreBodyPartData(request)
    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Body Part data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Body Part data")

    return render(request, 'app/body_part/form.html')


def BodyPartDataView(request):
    return render(request, 'app/body_part/list_all.html')

# Organ

def OrganForm(request):
    return render(request, 'app/organ/form.html')

def StoreOrgan(request):
    operationResponse = views.StoreOrganData(request)
    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Organ data")

    return render(request, 'app/organ/form.html')


def OrganDataView(request):
    return render(request, 'app/organ/list_all.html')

# Organ Problem

def OrganProblemForm(request):
    return render(request, 'app/organ_problem/form.html')
def StoreOrganProblem(request):
    operationResponse = views.StoreOrganProblemData(request)
    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Organ Problem data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Organ Problem data")

    return render(request, 'app/organ_problem/form.html')

def OrganProblemDataView(request):
    return render(request, 'app/organ_problem/list_all.html')

# Problem Specification
def ProblemSpecificationForm(request):
    return render(request, 'app/problem_specification/form.html')

def StoreProblemSpecification(request):
    operationResponse = views.StoreProblemSpecificationData(request)
    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Problem Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Problem Specification data")

    return render(request, 'app/problem_specification/form.html')

def ProblemSpecificationDataView(request):
    return render(request, 'app/problem_specification/list_all.html')

# Department Specification

def DepartmentSpecificationForm(request):
    return render(request, 'app/department_specification/form.html')

def StoreDepartmentSpecification(request):
    operationResponse = views.StoreDepartmentSpecificationData(request)
    if operationResponse.status_code == 200:
        messages.add_message(request, messages.INFO, "Department Specification data stored successfully")
    else:
        messages.add_message(request, messages.ERROR, "Error in storing Department Specification data")

    return render(request, 'app/department_specification/form.html')

def DepartmentSpecificationDataView(request):
    return render(request, 'app/department_specification/list_all.html')



#####################################

def GetAdminDashBoard(request):
    messages.add_message(request, messages.INFO, "Welcome to the dashboard")
    return render(request, 'admin/dashboard.html')

def GetAdminForm(request):
    return render(request, 'admin/form.html')


def index(request):
     return render(request, 'landing/index.html')

def register(request):
    return render(request,'landing/register.html')