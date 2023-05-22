from django.urls import path
from . import views


urlpatterns = [
    path('',views.Index,name="home"),
    path('add/doctor',views.StoreDoctorInfo,name="add.doctor"),
]
