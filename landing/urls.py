from django.urls import path, include
from landing.views.webs.landing_web import *
from adminpanel.views.webs.login_web import *
from adminpanel.views.apis.logout import logout
from landing.views.webs.patient_web import *

urlpatterns = [
    # auth paths ..
    path('logout/', logout, name='logout'),

    # Landing Frontend paths
    path('', landing_dashboard, name="landing_dashboard"),

    # landing path groups ...
    path('landing/', include([
        path('doctors/', landing_doctors, name="landing_doctors"),
        path('faq/', landing_faq, name="landing_faq"),
        path('article/', landing_article, name="landing_article"),
        path('login/', login, name="login"),
        path('login/checking/', check_login_is_valid, name="check_login_is_valid"),
        # path('landing/doctor/register/', doctor_register, name="doctor_register"),
        path('predict/', predict, name="predict"),

        path('patient/', include([
            path('add/', patient_form, name="add_patient_form"),
            path('store/', store_patient, name="store_patient"),
        ])),
    ])),
]
