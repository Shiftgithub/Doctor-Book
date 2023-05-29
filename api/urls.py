from django.urls import path
from . import views
from . import web

urlpatterns = [

    # Backend paths

    path('api/add/department/', views.StoreDepartmentData, name="add_department"),
    path('api/department/list/', views.getAllDepartmentsList, name="department_list"),

    path('api/add/doctor/', views.StoreDoctorData, name="add_doctor"),
    path('api/doctors/list/', views.getAllDoctorsList, name="doctor_list"),

    path('api/add/bodypart/', views.StoreBodyPartData, name="add_bodypart"),
    path('api/bodypart/list/', views.getAllBodyPartsList, name="bodypart_list"),

    path('api/add/organ/', views.StoreOrganData, name="add_organ"),
    path('api/organ/list/', views.getAllOrgansList, name="organ_list"),
    path('api/organs/list/', views.OrganApiView, name="organs_list"),

    path('api/add/organ/problem/', views.StoreOrganProblemData,
         name="add_organ_problem"),
    path('api/organ/problem/list/', views.getAllOrganProblemList,
         name="organ_problem_list"),

    path('api/add/problem/specification/', views.StoreProblemSpecificationData,
         name="add_problem_specification"),
    path('api/problem/specification/list/', views.getAllProblemSpecificationList,
         name="problem_specification_list"),

    path('api/add/department/specification/', views.StoreDepartmentSpecificationData,
         name="add_department_specification"),
    path('api/department/specification/list/', views.getAllDepartmentSpecificationsList,
         name="department_specification_list"),



    # Frontend paths

    path('', web.Dashboard, name="dashboard"),

    path('frontend/add/department/', web.DepartmentForm,
         name="add_department_form"),
    path('frontend/department/list/',
         web.DepartmentDataView, name="department_list"),

    path('frontend/add/doctor/', web.DoctorForm, name="add_doctor_form"),
    path('frontend/doctors/list/', web.DoctorDataView, name="doctor_list"),

    path('frontend/add/bodypart/', web.BodyPartForm, name="add_bodypart_form"),
    path('frontend/bodypart/list/', web.BodyPartDataView, name="bodypart_list"),

    path('frontend/add/organ/', web.OrganForm, name="add_organ_form"),
    path('frontend/organ/list/', web.OrganDataView, name="organ_list"),

    path('frontend/add/organ/problem/', web.OrganProblemForm,
         name="add_organ_problem_form"),
    path('frontend/organ/problem/list/',
         web.OrganProblemDataView, name="organ_problem_list"),

    path('frontend/add/problem/specification/', web.ProblemSpecificationForm,
         name="add_problem_specification_form"),
    path('frontend/problem/specification/list/',
         web.ProblemSpecificationDataView, name="problem_specification_list"),

    path('frontend/add/department/specification/', web.DepartmentSpecificationForm,
         name="add_department_specification_form"),
    path('frontend/department/specification/list/',
         web.DepartmentSpecificationDataView, name="department_specification_list"),

     path('myadmin/dashboard/', web.GetAdminDashBoard, name="admin_dashboard"),
     path('myadmin/form/', web.GetAdminForm, name="admin_form"),
]
