from django.urls import path

from landing.views.apis.logout import logout
from landing.views.webs.landing_web import *
from landing.views.webs.login_web import *

urlpatterns = [
    # auth paths ..
    path('logout/', logout, name='logout'),

    # Landing Frontend paths
    path('', landing_dashboard, name="landing_dashboard"),
    path('landing/doctors/', landing_doctors, name="landing_doctors"),
    path('landing/faq', landing_faq, name="landing_faq"),
    path('landing/article', landing_article, name="landing_article"),
    path('landing/login/', login, name="login"),
    path('landing/login/checking/', check_login_is_valid, name="check_login_is_valid"),
    # path('landing/doctor/register/', doctor_register, name="doctor_register"),
    path('landing/predict/', predict, name="predict"),
    path('landing/store/patient', store_patient, name="store_patient"),

]
