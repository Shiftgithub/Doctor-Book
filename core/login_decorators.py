from django.urls import resolve
from django.contrib import messages
from django.shortcuts import redirect

from admin.constants.constants import *


def protected_view(view_func):
    def wrapper(request, *args, **kwargs):
        if request.session.get('user_id'):
            role = request.session.get('user_role')
            requested_path = resolve(request.path_info).url_name
            if role == ROLE_ADMIN:
                routes = [
                    # dashboard
                    'admin_dashboard',
                    'user_details',
                    'change_theme',
                    'reset_password_form',
                    'store_new_password',
                    'store_new_email',
                    'change_email_form',

                    'view_admin',
                    'edit_admin_form',
                    'edit_admin',

                    # for article
                    'article_form',
                    'store_article',
                    'article_list',
                    'view_article_data',
                    'edit_article_form',
                    'edit_article',
                    'delete_article',

                    # for body part
                    'body_part_form',
                    'store_body_part',
                    'body_part_list',
                    'edit_body_part_form',
                    'edit_body_part',
                    'delete_body_part',

                    # for department
                    'department_form',
                    'store_department',
                    'department_list',
                    'edit_department_form',
                    'edit_department',
                    'delete_department',

                    # for doctor
                    'doctor_form',
                    'store_doctor',
                    'doctor_list',
                    'view_doctor_data',
                    'edit_doctor_form',
                    'edit_doctor',
                    'delete_doctor',

                    'work_form',
                    'store_work',
                    'working_list',
                    'working_view',

                    'edu_form',
                    'store_edu',
                    'edu_list',
                    'edu_view',
                    'edit_edu_form',
                    'edit_edu',

                    'social_form',
                    'store_social',
                    'social_list',
                    'social_view',
                    'edit_social_form',
                    'edit_social',

                    'award_form',
                    'store_award',
                    'award_list',
                    'award_view',
                    'edit_award_form',
                    'edit_award',

                    # for department specification
                    'department_specification_form',
                    'store_department_specification',
                    'department_specification_list',
                    'view_department_specification',
                    'edit_department_specification_form',
                    'edit_department_specification',
                    'delete_department_specification',

                    # for faq
                    'faq_form',
                    'store_faq',
                    'faq_list',
                    'edit_faq_form',
                    'edit_faq',
                    'delete_faq',

                    # for lab test
                    'lab_test_form',
                    'store_lab_test',
                    'lab_test_list',
                    'edit_lab_test_form',
                    'edit_lab_test',
                    'delete_lab_test',

                    # for medicine
                    'medicine_form',
                    'store_medicine',
                    'medicine_list',
                    'view_medicine_data',
                    'edit_medicine_form',
                    'edit_medicine',
                    'delete_medicine',

                    # for organ
                    'organ_form',
                    'store_organ',
                    'organ_list',
                    'edit_organ_form',
                    'edit_organ',
                    'delete_organ',

                    # for organ
                    'organ_problem_specification_form',
                    'store_organ_problem_specification',
                    'organ_problem_specification_list',
                    'view_organ_problem_specification',
                    'edit_organ_problem_specification_form',
                    'edit_organ_problem_specification',
                    'delete_organ_problem_specification',

                    # for patient
                    'patient_list',
                    'view_patient',
                    'edit_patient_form',
                    'edit_patient',
                ]
                if requested_path in routes:
                    return view_func(request, *args, **kwargs)
                else:
                    return redirect('admin_dashboard')

            elif role == ROLE_DOCTOR:
                routes = [
                    'doctor_dashboard',
                    'user_details',
                    'change_theme',
                    'reset_password_form',
                    'store_new_password',
                    'store_new_email',
                    'change_email_form',

                    # for article
                    'article_form',
                    'article_all_list',

                    # for doctor
                    'view_doctor_data',
                    'edit_doctor_form',
                    'edit_doctor',

                    'working_view',

                    'edu_view',
                    'edit_edu_form',
                    'edit_edu',

                    'social_view',
                    'edit_social_form',
                    'edit_social',

                    'award_view',
                    'edit_award_form',
                    'edit_award',

                    # for faq
                    'faq_form',
                    'faq_all_list',

                    # for lab test
                    'lab_test_form',
                    'store_lab_test',
                    'lab_test_list',
                    'edit_lab_test_form',
                    'edit_lab_test',
                    'delete_lab_test',

                    # for medicine
                    'medicine_form',
                    'store_medicine',
                    'medicine_list',
                    'view_medicine_data',
                    'edit_medicine_form',
                    'edit_medicine',
                    'delete_medicine',

                    # for  medicine prescription
                    'medicine_prescription_form',
                    'store_medicine_prescription',
                    'medine_prescription_list',
                    'medicine_prescription_view',
                    'print_medicine_prescription',

                    # for  labtest prescription
                    'lab_prescription_form',
                    'store_lab_prescription',
                    'lab_prescription_list',
                    'lab_prescription_view',
                    'print_labtest_prescription',

                    # for patient
                    'patient_form',
                    'store_patient_by_doctor',
                    'patient_list',
                    'view_patient',
                    'edit_patient_form',
                    'edit_patient',

                    # for appointment
                    'appointment_form',
                    # 'appointment',
                    'store_appointment_by_doctor',
                    'view_appointment',
                    'edit_appointment_form',
                    'edit_appointment',
                    'appointment_list_by_date',
                    'appointment_list_by_doctor',
                ]
                if requested_path in routes:
                    return view_func(request, *args, **kwargs)
                else:
                    return redirect('doctor_dashboard')

            elif role == ROLE_PATIENT:
                routes = [
                    'patient_dashboard',
                    'user_details',
                    'change_theme',
                    'reset_password_form',
                    'store_new_password',
                    'store_new_email',
                    'change_email_form',

                    'medicine_prescription_data_view_by_patient',
                    'medicine_prescription_view',
                    'print_medicine_prescription',

                    'lab_test_prescription_data_view_by_patient',
                    'lab_prescription_view',
                    'print_labtest_prescription',

                    # for patient
                    'view_patient',
                    'edit_patient_form',
                    'edit_patient',

                    'find_doctors',
                    'check_doctor_profile',

                    'patient_predict_form',
                    'patient_prediction',

                    'appointment',
                    'view_appointment',
                    'appointment_list_by_patient',

                    'prediction_list',
                    'prediction_view',
                ]
                if requested_path in routes:
                    return view_func(request, *args, **kwargs)
                else:
                    return redirect('patient_dashboard')

            else:
                # Unauthorized role, show an error message
                messages.add_message(request, messages.ERROR, "You are not authorized to access this page")
                return redirect('login')
        else:
            # User is not logged in, show an error message and redirect to login
            messages.add_message(request, messages.ERROR, "Please login first to access this page")
            return redirect('login')

    return wrapper
