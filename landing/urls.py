from django.urls import path, include

from adminpanel.views.webs.auth.reset_password_web import *
from adminpanel.views.webs.auth.verify_otp_web import *
from adminpanel.views.webs.auth.forget_password_web import *
from landing.views.webs.landing_web import *
from adminpanel.views.webs.auth.login_web import *
from adminpanel.views.apis.auth.logout import logout
from landing.views.webs.patient_web import *
from adminpanel.views.apis.auth.resend_otp import *
from adminpanel.views.webs.auth.resend_otp_web import *

urlpatterns = [
    # auth paths ..
    path('logout/', logout, name='logout'),

    # Landing Frontend paths
    path('', landing_dashboard, name="landing_dashboard"),

    # landing path groups ...
    path('landing/', include([
        path('doctors/', landing_doctors, name="landing_doctors"),
        path('faq/', landing_faq, name="landing_faq"),
        path('article/', include([
            path('', landing_article, name="landing_article"),
            path('view/<int:article_id>/', landing_single_article, name="landing_article_view"),
        ])),

        path('login/', login, name="login"),
        path('login/checking/', check_login_is_valid, name="check_login_is_valid"),
        path('doctor/register/', doctor_register, name="doctor_register"),
        path('predict/', predict, name="predict"),

        path('patient/', include([
            path('add/', patient_form, name="add_patient_form"),
            path('store/', store_patient, name="store_patient"),
        ])),
        path('otp/', include([
            # path('', otp_form, name="otp"),
            path('', otp_form, name="otp"),
            path('varify/', verify_otp_method, name="otp_varify"),
        ])),
        path('forget/pass/form/', forget_password_form, name="forget_password_form"),
        path('forget/pass/', forget_password_method, name="forget_password"),

        path('reset/pass/form/', reset_password_form, name="reset_password_form"),
        path('reset/pass/', reset_password_method, name="reset_password"),
        path('resend/otp/<str:email>/', resend_otp_method, name="resend_otp"),
    ])),
]
