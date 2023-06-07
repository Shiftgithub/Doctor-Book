from django.urls import path

import doctor.views
import myadmin.views

urlpatterns = [

    # Backend paths
    path('api/add/bodypart/', myadmin.views.store_bodypart_data, name="add_bodypart"),
    path('api/bodypart/list/', myadmin.views.get_all_bodypart_list, name="bodypart_list"),
    path('api/bodypart/edit/<int:bodypart_id>/', myadmin.views.edit_bodypart_data, name='edit_bodypart'),

    # organ api path
    path('api/add/organ/', myadmin.views.store_organ_data, name="add_organ"),
    path('api/organs/list/', myadmin.views.get_all_organs_list, name="organ_list"),

    path('api/add/organ/problem/', myadmin.views.store_organ_problem_data, name="add_organ_problem"),
    path('api/organ/problem/list/', myadmin.views.get_all_organ_problem_list, name="organ_problem_list"),

    path('api/add/problem/specification/', myadmin.views.store_problem_specification_data, name="add_problem_specification"),
    path('api/problem/specification/list/', myadmin.views.get_all_problem_specification_list, name="problem_specification_list"),

    path('api/add/department/', myadmin.views.store_department_data, name="add_department"),
    path('api/department/list/', myadmin.views.get_all_departments_list, name="department_list"),

    path('api/add/department/specification/', myadmin.views.store_department_specification_data, name="add_department_specification"),
    path('api/department/specification/list/', myadmin.views.get_all_department_specifications_list, name="department_specification_list"),

    path('api/add/doctor/', doctor.views.store_doctor_data, name="add_doctor"),
    path('api/doctors/list/', doctor.views.get_all_doctors_list, name="doctor_list"),

    path('api/add/faq/', myadmin.views.store_faq_data, name="add_department"),
    path('api/faq/list/', myadmin.views.get_all_faq_list, name="faq_list"),

    path('api/add/article/', myadmin.views.store_article_data, name="add_article"),
    path('api/article/list/', myadmin.views.get_all_article_list, name="article_list"),

]
