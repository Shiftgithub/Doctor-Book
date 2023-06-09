from django.urls import path

import doctor.views
import myadmin.views

urlpatterns = [

    # bodypart paths
    path('api/add/bodypart/', myadmin.views.store_bodypart_data, name="add_bodypart"),
    path('api/bodypart/list/', myadmin.views.get_all_bodypart_list, name="bodypart_list"),
    path('api/bodypart/edit/<int:bodypart_id>/', myadmin.views.edit_bodypart_data, name='edit_bodypart'),
    path('api/bodypart/delete/<int:bodypart_id>/', myadmin.views.softdelete_bodypart_data, name='softdelete_bodypart'),
    path('api/bodypart/view/<int:bodypart_id>/', myadmin.views.bodypart_dataview, name='view_bodypart'),

    # organ api paths
    path('api/add/organ/', myadmin.views.store_organ_data, name="add_organ"),
    path('api/organs/list/', myadmin.views.get_all_organs_list, name="organ_list"),

    path('api/organ/edit/<int:organ_id>/', myadmin.views.edit_organ_data, name='edit_organ'),
    path('api/organ/delete/<int:organ_id>/', myadmin.views.softdelete_organ_data, name='delete_organ'),
    path('api/organ/view/<int:organ_id>/', myadmin.views.organ_dataview, name='view_organ'),

    # organ Problem api paths

    path('api/add/organ/problem/', myadmin.views.store_organ_problem_data, name="add_organ_problem"),
    path('api/organ/problem/list/', myadmin.views.get_all_organ_problem_list, name="organ_problem_list"),

    path('api/organ/problem/edit/<int:organ_problem_id>/', myadmin.views.edit_organ_problem_data,
         name='edit_organ_problem'),
    path('api/organ/problem/delete/<int:organ_problem_id>/', myadmin.views.softdelete_organ_problem_data,
         name='delete_organ_problem'),
    path('api/organ/problem/view/<int:organ_problem_id>/', myadmin.views.organ_problem_dataview,
         name='view_organ_problem'),

    # problem specification api paths

    path('api/add/problem/specification/', myadmin.views.store_problem_specification_data,
         name="add_problem_specification"),
    path('api/problem/specification/list/', myadmin.views.get_all_problem_specification_list,
         name="problem_specification_list"),

    path('api/problem/specification/edit/<int:problem_specification_id>/',
         myadmin.views.edit_problem_specification_data, name='edit_problem_specification'),
    path('api/problem/specification/delete/<int:problem_specification_id>/',
         myadmin.views.softdelete_problem_specification_data, name='delete_problem_specification'),
    path('api/problem/specification/view/<int:problem_specification_id>/',
         myadmin.views.problem_specification_dataview, name='view_problem_specification'),

    # department api paths

    path('api/add/department/', myadmin.views.store_department_data, name="add_department"),
    path('api/department/list/', myadmin.views.get_all_departments_list, name="department_list"),

    path('api/department/edit/<int:department_id>/', myadmin.views.edit_department_data, name='edit_department'),
    path('api/department/delete/<int:department_id>/', myadmin.views.softdelete_department_data,
         name='delete_department'),
    path('api/department/view/<int:department_id>/', myadmin.views.department_dataview, name='view_department'),

    # department specification api paths

    path('api/add/department/specification/', myadmin.views.store_department_specification_data,
         name="add_department_specification"),
    path('api/department/specification/list/', myadmin.views.get_all_department_specifications_list,
         name="department_specification_list"),

    path('api/department/specification/edit/<int:department_specification_id>/',
         myadmin.views.edit_department_specification_data,
         name='edit_department_specification'),
    path('api/department/specification/delete/<int:department_specification_id>/',
         myadmin.views.softdelete_department_specification_data,
         name='delete_department_specification'),
    path('api/department/specification/view/<int:department_specification_id>/',
         myadmin.views.department_specification_dataview,
         name='view_department_specification'),

    # doctor api paths

    path('api/add/doctor/', doctor.views.store_doctor_data, name="add_doctor"),
    path('api/doctors/list/', doctor.views.get_all_doctors_list, name="doctor_list"),

    # faq api paths

    path('api/add/faq/', myadmin.views.store_faq_data, name="add_department"),
    path('api/faq/list/', myadmin.views.get_all_faq_list, name="faq_list"),

    path('api/faq/edit/<int:faq_id>/', myadmin.views.edit_faq_data, name='edit_faq'),
    path('api/faq/delete/<int:faq_id>/', myadmin.views.softdelete_faq_data, name='delete_faq'),
    path('api/faq/view/<int:faq_id>/', myadmin.views.faq_dataview, name='view_faq'),

    # article api paths

    path('api/add/article/', myadmin.views.store_article_data, name="add_article"),
    path('api/article/list/', myadmin.views.get_all_article_list, name="article_list"),

]
