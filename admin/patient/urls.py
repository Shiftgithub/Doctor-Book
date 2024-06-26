from .webs import *
from django.urls import path, include
# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

# from admin.authentication.user.views import check_username_availability, check_email_availability

urlpatterns = [
    # patient admin path
    path(
        '',
        include(
            [
                path('form/', patient_form, name='add_patient_form'),
                path('store/', store_patient, name='store_patient'),

                path('form-by-doctor/', protected_view(patient_form_for_doctor), name='patient_form'),
                path('store-by-doctor/', protected_view(store_patient_by_doctor), name='store_patient_by_doctor'),
                path('list/', protected_view(get_patient_data), name='patient_list'),
                path('view/<int:patient_id>/', protected_view(view_patient), name='view_patient'),
                path('update/<int:patient_id>/', protected_view(edit_patient_form), name='edit_patient_form'),
                path('edit/<int:patient_id>/', protected_view(edit_patient), name='edit_patient'),

                path("check-doctors-list/", protected_view(find_doctors), name="find_doctors"),
                path('check-doctor-profile/<int:doctor_id>/', protected_view(check_doctor_profile),
                     name='check_doctor_profile'),
                path('prediction-form/', patient_predict_form, name='patient_predict_form'),
                path('', protected_view(predict_result), name='patient_prediction'),
                path('appointment/<int:doctor_id>/', protected_view(appointment), name='appointment'),
            ]
        ),
    ),
]
