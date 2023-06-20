from django.urls import path

from adminpanel.views.article_views import *
from adminpanel.views.bodypart_views import *
from adminpanel.views.department_views import *
from adminpanel.views.department_specification_views import *
from adminpanel.views.doctor_views import *
from adminpanel.views.organ_views import *
from adminpanel.views.organ_problem_specification_views import *
from adminpanel.views.faq_views import *

urlpatterns = [

    # bodypart paths
    path('add/bodypart/', store_bodypart_data, name="add_bodypart"),
    path('bodypart/list/', get_all_bodypart_list, name="bodypart_list"),
    path('bodypart/edit/<int:bodypart_id>/', edit_bodypart_data, name='edit_bodypart'),
    path('bodypart/delete/<int:bodypart_id>/', softdelete_bodypart_data, name='softdelete_bodypart'),
    path('bodypart/view/<int:bodypart_id>/', bodypart_dataview, name='view_bodypart'),

    # organ api paths
    path('add/organ/', store_organ_data, name="add_organ"),
    path('organs/list/', get_all_organs_list, name="organ_list"),

    path('organ/edit/<int:organ_id>/', edit_organ_data, name='edit_organ'),
    path('organ/delete/<int:organ_id>/', softdelete_organ_data, name='delete_organ'),
    path('organ/view/<int:organ_id>/', organ_dataview, name='view_organ'),

    # organ Problem api paths

    path('add/organ/problem/', store_organ_problem_specification_data, name="add_organ_problem_specification"),
    path('organ/problem/list/', get_all_organ_problem_specification_list, name="organ_problem_specification_list"),

    path('organ/problem/edit/<int:organ_problem_specification_id>/', edit_organ_problem_specification_data,
         name='edit_organ_problem_specification'),
    path('organ/problem/delete/<int:organ_problem_specification_id>/', softdelete_organ_problem_specification_data,
         name='delete_organ_problem_specification'),
    path('organ/problem/view/<int:organ_problem_specification_id>/', organ_problem_specification_dataview,
         name='view_organ_problem_specification'),

    # department api paths

    path('add/department/', store_department_data, name="add_department"),
    path('department/list/', get_all_departments_list, name="department_list"),

    path('department/edit/<int:department_id>/', edit_department_data, name='edit_department'),
    path('department/delete/<int:department_id>/', softdelete_department_data,
         name='delete_department'),
    path('department/view/<int:department_id>/', department_dataview, name='view_department'),

    # department specification api paths

    path('add/department/specification/', store_department_specification_data,
         name="add_department_specification"),
    path('department/specification/list/', get_all_department_specifications_list,
         name="department_specification_list"),

    path('department/specification/edit/<int:department_specification_id>/',
         edit_department_specification_data,
         name='edit_department_specification'),
    path('department/specification/delete/<int:department_specification_id>/',
         softdelete_department_specification_data,
         name='delete_department_specification'),
    path('department/specification/view/<int:department_specification_id>/',
         department_specification_dataview,
         name='view_department_specification'),

    # doctor api paths

    #     path('add/doctor/', doctor.views.store_doctor_data, name="add_doctor"),
    #     path('doctors/list/', doctor.views.get_all_doctors_list, name="doctor_list"),

    # faq api paths

    path('add/faq/', store_faq_data, name="add_department"),
    path('faq/list/', get_all_faq_list, name="faq_list"),

    path('faq/edit/<int:faq_id>/', edit_faq_data, name='edit_faq'),
    path('faq/delete/<int:faq_id>/', softdelete_faq_data, name='delete_faq'),
    path('faq/view/<int:faq_id>/', faq_dataview, name='view_faq'),

    # article api paths

    path('add/article/', store_article_data, name="add_article"),
    path('article/list/', get_all_article_list, name="article_list"),

]
