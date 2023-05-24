from django.urls import path
from . import views
from . import web

urlpatterns = [

    # Backend paths

    path('api/add/department/', views.StoreDepartmentData, name="add_department"),
    path('api/department/list', views.getAllDepartmentsList, name="department_list"),

    path('api/add/doctor/', views.StoreDoctorData, name="add_doctor"),
    path('api/doctors/list', views.getAllDoctorsList, name="doctor_list"),

    path('api/add/bodypart/', views.StoreBodyPartData, name="add_bodypart"),
    path('api/bodypart/list', views.getAllBodyPartsList, name="bodypart_list"),

    # Frontend paths

    path('', web.Dashboard, name="dashboard"),

    path('frontend/add/department/', web.DepartmentForm,
         name="add_department_form"),
    path('frontend/department/list',
         web.DepartmentDataView, name="department_list"),

    path('frontend/add/doctor/', web.DoctorForm, name="add_doctor_form"),
    path('frontend/doctors/list', web.DoctorDataView, name="doctor_list"),

    path('frontend/add/bodypart/', web.BodyPartForm, name="add_bodypart_form"),
    path('frontend/bodypart/list', web.BodyPartDataView, name="bodypart_list"),
]
