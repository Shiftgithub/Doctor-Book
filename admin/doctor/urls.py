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
                path('form/', protected_view(doctor_form), name='doctor_form', ),
                path('store/', protected_view(store_doctor), name='store_doctor'),
                path('list/', protected_view(get_doctor_data), name='doctor_list'),
                path('view/<int:doctor_id>/', protected_view(get_doctor_data_by_id), name='view_doctor_data'),
                path('update/<int:doctor_id>/', protected_view(edit_doctor_form), name='edit_doctor_form'),
                path('edit/<int:doctor_id>/', protected_view(edit_doctor), name='edit_doctor'),
                path('delete/<int:doctor_id>/', protected_view(delete_doctor), name='delete_doctor'),

                path('work-form/', protected_view(work_form), name='work_form', ),
                path('work-store/', protected_view(store_work_details), name='store_work'),
                path('working-list/', protected_view(get_doctor_working_data), name='working_list'),
                path('working-view/<int:doctor_id>/', protected_view(get_doctor_working_data_by_id),
                     name='working_view'),

                path('edu-form/', protected_view(edu_form), name='edu_form'),
                path('edu-store/', protected_view(store_edu), name='store_edu'),
                path('edu-list/', protected_view(get_doctor_edu_data), name='edu_list'),
                path('edu-view/<int:doctor_id>/', protected_view(get_doctor_edu_data_by_id), name='edu_view'),
                path('edit-edu/<int:doctor_id>/', protected_view(edit_edu_form), name='edit_edu_form'),
                path('update-edu/<int:doctor_id>/', protected_view(edit_doctor_edu), name='edit_edu'),

                path('social-form/', protected_view(social_form), name='social_form'),
                path('social-store/', protected_view(store_social), name='store_social'),
                path('social-list/', protected_view(get_doctor_social_data), name='social_list'),
                path('social-view/<int:doctor_id>/', protected_view(get_doctor_social_data_by_id), name='social_view'),
                path('edit-social/<int:doctor_id>/', protected_view(edit_social_form), name='edit_social_form'),
                path('update-social/<int:doctor_id>/', protected_view(edit_doctor_social), name='edit_social'),

                path('chamber-form/', protected_view(chamber_form), name='chamber_form'),
                path('chamber-store/', protected_view(store_chamber), name='store_chamber'),
                path('chamber-list/', protected_view(get_doctor_chamber_data), name='chamber_list'),
                path('chamber-view/<int:doctor_id>/', protected_view(view_chamber), name='view_chamber'),
                path('edit-chamber/<int:doctor_id>/', protected_view(edit_chamber_form), name='edit_chamber_form'),
                path('update-chamber/<int:doctor_id>/', protected_view(edit_doctor_chamber),
                     name='edit_chamber'),

                path('award-form/', protected_view(award_form), name='award_form'),
                path('award-store/', protected_view(store_award), name='store_award'),
                path('award-list/', protected_view(get_doctor_award_data), name='award_list'),
                path('award-view/<int:doctor_id>/', protected_view(get_doctor_award_data_by_id), name='award_view'),
                path('edit-award/<int:doctor_id>/', protected_view(edit_award_form), name='edit_award_form'),
                path('update-award/<int:doctor_id>/', protected_view(edit_doctor_award), name='edit_award'),

            ]
        ),
    ),
]
