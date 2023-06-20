from django.urls import path
from adminpanel.webs.article_web import *
from adminpanel.webs.bodypart_web import *
from adminpanel.webs.dashboard_web import *
from adminpanel.webs.doctor_web import *
from adminpanel.webs.department__web import *
from adminpanel.webs.department_specification_web import *
from adminpanel.webs.organ_web import *
from adminpanel.webs.organ_problem_specification_web import *
from adminpanel.webs.faq_web import *

from adminpanel.views.ajax_views import *

urlpatterns = [

    # myadmin paths
    path('myadmin/dashboard/', dashboard, name="admin_dashboard"),

    # bodypart myadmin path
    path('myadmin/add/bodypart/', bodypart_form, name="add_bodypart_form"),
    path('myadmin/store/bodypart/', store_bodypart, name="store_bodypart"),
    path('myadmin/bodypart/list/', bodypart_data_view, name="bodypart_list"),
    path('myadmin/bodypart/update/<int:bodypart_id>/', edit_bodypart_form, name="edit_bodypart_form"),
    path('myadmin/bodypart/edit/<int:bodypart_id>/', edit_bodypart, name='edit_bodypart'),
    path('myadmin/bodypart/delete/<int:bodypart_id>/', delete_bodypart, name='delete_bodypart'),

    # organ myadmin path
    path('myadmin/add/organ/', organ_form, name="add_organ_form"),
    path('myadmin/store/organ/', store_organ, name="store_organ"),
    path('myadmin/organ/list/', organ_data_view, name="organ_list"),
    path('myadmin/organ/update/<int:organ_id>/', edit_organ_form, name="edit_organ_form"),
    path('myadmin/organ/edit/<int:organ_id>/', edit_organ, name='edit_organ'),
    path('myadmin/organ/delete/<int:organ_id>/', delete_organ, name='delete_organ'),

    # organ problem myadmin path

    path('myadmin/add/organ/problem/specification/', organ_problem_specification_form,
         name="add_organ_problem_specification_form"),
    path('myadmin/store/organ/problem/specification/',
         store_organ_problem_specification, name="store_organ_problem_specification"),
    path('myadmin/organ/problem/specification/list/',
         organ_problem_specification_data_view, name="organ_problem_specification_list"),
    path('myadmin/organ/problem/specification/update/<int:organ_problem_specification_id>/',
         edit_organ_problem_specification_form,
         name="edit_organ_problem_specification_form"),
    path('myadmin/organ/problem/specification/edit/<int:organ_problem_specification_id>/',
         edit_organ_problem_specification,
         name='edit_organ_problem_specification'),
    path('myadmin/organ/delete/problem/<int:organ_problem_specification_id>/', delete_organ_problem_specification,
         name='delete_organ_problem_specification'),
    path('myadmin/organ/view/problem/<int:organ_problem_specification_id>/', view_organ_problem_specification,
         name='view_organ_problem_specification'),

    # department myadmin path

    path('myadmin/add/department/', department_form,
         name="add_department_form"),
    path('myadmin/store/department/',
         store_department, name="store_department"),
    path('myadmin/department/list/',
         department_data_view, name="department_list"),
    path('myadmin/department/update/<int:department_id>/', edit_department_form, name="edit_department_form"),
    path('myadmin/department/edit/<int:department_id>/', edit_department, name='edit_department'),
    path('myadmin/department/delete/<int:department_id>/', delete_department, name='delete_department'),

    # department specification myadmin path

    path('myadmin/add/department/specification/', department_specification_form,
         name="add_department_specification_form"),
    path('myadmin/store/department/specification/', store_department_specification,
         name="store_department_specification"),
    path('myadmin/department/specification/list/',
         department_specification_data_view, name="department_specification_list"),
    path('myadmin/department/specification/update/<int:department_specification_id>/',
         edit_department_specification_form, name="edit_department_specification_form"),
    path('myadmin/department/specification/edit/<int:department_specification_id>/',
         edit_department_specification, name='edit_department_specification'),
    path('myadmin/department/specification/delete/<int:department_specification_id>/',
         delete_department_specification, name='delete_department_specification'),
    path('myadmin/department/specification/view/<int:department_specification_id>/',
         view_department_specification, name='view_department_specification'),

    # doctor myadmin path

    path('myadmin/add/doctor/', doctor_form, name="add_doctor_form"),
    path('myadmin/store/doctor/', store_doctor, name="store_doctor"),
    path('myadmin/doctors/list/', doctor_data_view, name="doctor_list"),

    # faq myadmin path
    path('myadmin/add/faq/', faq_form, name="add_faq_form"),
    path('myadmin/store/faq/', store_faq, name="store_faq"),
    path('myadmin/faq/list/', faq_data_view, name="faq_list"),
    path('myadmin/faq/update/<int:faq_id>/', edit_faq_form, name="edit_faq_form"),
    path('myadmin/faq/edit/<int:faq_id>/', edit_faq, name='edit_faq'),
    path('myadmin/faq/delete/<int:faq_id>/', delete_faq, name='delete_faq'),

    # article myadmin path
    path('myadmin/add/article/', article_form, name="add_article_form"),
    path('myadmin/store/article/', store_article, name="store_article"),
    path('myadmin/article/list', article_data_view, name="article_list"),

    # Ajax path
    path('myadmin/ajax/organ/<int:body_part_id>/', get_organs_by_bodypart, name="get_organs"),
    path('myadmin/ajax/organ/problem/specification/<int:organ_id>/', get_organ_problem_by_organ,
         name="get_organ_problems"),
]
