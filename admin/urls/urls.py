from django.urls import path, include

urlpatterns = [
    # admin path groups
    path('', include([
        path('ajax/', include('admin.ajax.urls')),
        path('article-', include('admin.article.urls')),
        path('body-part/', include('admin.bodypart.urls')),
        path('dashboard/', include('admin.dashboard.urls')),
        path('department-', include('admin.department.urls')),
        path('department-specification-', include('admin.department_speci.urls')),
        path('doctor-', include('admin.doctor.urls')),
        path('faq-', include('admin.faq.urls')),
        path('medicine-', include('admin.medicine.urls')),
        path('organ-', include('admin.organ.urls')),
        path('organ-problem-', include('admin.organ_problem_speci.urls')),
        path('patient-', include('admin.patient.urls')),
        path('prescription-', include('admin.prescription.urls')),
        path('user-', include('admin.authentication.user.urls')),
    ])),
    path('', include([
        path('login/', include('admin.authentication.login.urls')),
        path('logout/', include('admin.authentication.logout.urls')),
        path('resend/otp/', include('admin.authentication.otp.resendotp.urls')),
        path('', include('admin.authentication.otp.resetpassword.urls')),
        path('', include('admin.authentication.otp.verifyotp.urls')),

    ])),
]
