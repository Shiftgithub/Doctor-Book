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
    path('api/organ/list/', views.getAllOrgansList, name="organ_lists"),
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

    path('myadmin/dashboard/', web.GetAdminDashBoard, name="admin_dashboard"),
    path('', web.index, name="landing_dashboard"),

    # department frontend path

    path('frontend/add/department/', web.DepartmentForm,
         name="add_department_form"),
    path('frontend/store/department/', web.StoreDepartment, name="store_department"),
    path('frontend/department/list/',
         web.DepartmentDataView, name="department_list"),
     
     # department specification frontend path

    path('frontend/add/department/specification/', web.DepartmentSpecificationForm,
         name="add_department_specification_form"),
     path('frontend/store/department/specification/', web.StoreDepartmentSpecification, name="store_department_specification"),
    path('frontend/department/specification/list/',
         web.DepartmentSpecificationDataView, name="department_specification_list"),

    # doctor frontend path

    path('frontend/add/doctor/', web.DoctorForm, name="add_doctor_form"),
    path('frontend/store/doctor/', web.StoreDoctor, name="store_doctor"),
    path('frontend/doctors/list/', web.DoctorDataView, name="doctor_list"),

    # bodypart frontend path

    path('frontend/add/bodypart/', web.BodyPartForm, name="add_bodypart_form"),
    path('frontend/store/bodypart/', web.StoreBodyPart, name="store_bodypart"),
    path('frontend/bodypart/list/', web.BodyPartDataView, name="bodypart_list"),

    # organ frontend path

    path('frontend/add/organ/', web.OrganForm, name="add_organ_form"),
    path('frontend/store/organ/', web.StoreOrgan, name="store_organ"),
    path('frontend/organ/list/', web.OrganDataView, name="organ_list"),

    # organ problem frontend path

     path('frontend/add/organ/problem/', web.OrganProblemForm,
         name="add_organ_problem_form"),
     path('frontend/store/organ/problem/', web.StoreOrganProblem, name="store_organ_problem"),
     path('frontend/organ/problem/list/',
         web.OrganProblemDataView, name="organ_problem_list"),

    # problem specification frontend path

    path('frontend/add/problem/specification/', web.ProblemSpecificationForm,
         name="add_problem_specification_form"),
    path('frontend/store/problem/specification/', web.StoreProblemSpecification, name="store_problem_specification"),
    path('frontend/problem/specification/list/',
         web.ProblemSpecificationDataView, name="problem_specification_list"),

    
    # dashboard frontend path

     path('register/', web.register, name="register"),

]
