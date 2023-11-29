from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # department specification adminpanel path
    path(
        '',
        include(
            [
                path('add/', protected_view(doctor_form), name='doctor_form', ),
                path('store/', protected_view(store_doctor), name='store_doctor'),

                path('work-form/', protected_view(work_form), name='work_form', ),
                path('work-store/', protected_view(store_work_details), name='store_work'),

                path('edu-form/', protected_view(edu_form), name='edu_form'),
                path('edu-store/', protected_view(store_edu), name='store_edu'),

                path('social-form/', protected_view(social_form), name='social_form'),
                path('social-store/', protected_view(store_social), name='store_social'),

                path('award-form/', protected_view(award_form), name='award_form'),
                path('award-store/', protected_view(store_award), name='store_award'),

                path('list/', protected_view(get_doctor_data), name='doctor_list'),
                path('view/<int:doctor_id>/', protected_view(get_doctor_data_by_id), name='view_doctor_data', ),
                path('update/<int:doctor_id>/', protected_view(edit_doctor_form), name='edit_doctor_form'),
                path('edit/<int:doctor_id>/', protected_view(edit_doctor), name='edit_doctor'),
                path('delete/<int:doctor_id>/', protected_view(delete_doctor), name='delete_doctor'),
            ]
        ),
    ),
]
