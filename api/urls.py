from django.urls import path
from . import views
from . import web
# from .Web import DoctorListView

urlpatterns = [
    # Backend paths

    path('api/add/doctor/', views.CreateDoctorProfile, name="add_doctor"),
    path('api/doctors/list', views.getAllDoctorsList,name="doctor_list"),


    # Frontend paths

    path('frontend/add/doctor/form/', web.DoctorForm, name="add_doctor_form"),
    path('frontend/doctors/list', web.DoctorDataView),
]
