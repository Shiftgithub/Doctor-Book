from django.urls import path
from adminpanel.views.webs.article_web import *
from adminpanel.views.webs.bodypart_web import *
from adminpanel.views.webs.dashboard_web import *
from adminpanel.views.webs.doctor_web import *
from adminpanel.views.webs.department__web import *
from adminpanel.views.webs.department_specification_web import *
from adminpanel.views.webs.organ_web import *
from adminpanel.views.webs.organ_problem_specification_web import *
from adminpanel.views.webs.faq_web import *

from adminpanel.views.apis.ajax_views import *

urlpatterns = [

    # adminpanel paths
    path('adminpanel/dashboard/', dashboard, name="admin_dashboard"),

    # bodypart adminpanel path
    path('adminpanel/add/bodypart/', bodypart_form, name="add_bodypart_form"),
    path('adminpanel/store/bodypart/', store_bodypart, name="store_bodypart"),
    path('adminpanel/bodypart/list/', bodypart_data_view, name="bodypart_list"),
    path('adminpanel/bodypart/update/<int:bodypart_id>/', edit_bodypart_form, name="edit_bodypart_form"),
    path('adminpanel/bodypart/edit/<int:bodypart_id>/', edit_bodypart, name='edit_bodypart'),
    path('adminpanel/bodypart/delete/<int:bodypart_id>/', delete_bodypart, name='delete_bodypart'),

    # organ adminpanel path
    path('adminpanel/add/organ/', organ_form, name="add_organ_form"),
    path('adminpanel/store/organ/', store_organ, name="store_organ"),
    path('adminpanel/organ/list/', organ_data_view, name="organ_list"),
    path('adminpanel/organ/update/<int:organ_id>/', edit_organ_form, name="edit_organ_form"),
    path('adminpanel/organ/edit/<int:organ_id>/', edit_organ, name='edit_organ'),
    path('adminpanel/organ/delete/<int:organ_id>/', delete_organ, name='delete_organ'),

    # organ problem adminpanel path

    path('adminpanel/add/organ/problem/specification/', organ_problem_specification_form,
         name="add_organ_problem_specification_form"),
    path('adminpanel/store/organ/problem/specification/',
         store_organ_problem_specification, name="store_organ_problem_specification"),
    path('adminpanel/organ/problem/specification/list/',
         organ_problem_specification_data_view, name="organ_problem_specification_list"),
    path('adminpanel/organ/problem/specification/update/<int:organ_problem_specification_id>/',
         edit_organ_problem_specification_form,
         name="edit_organ_problem_specification_form"),
    path('adminpanel/organ/problem/specification/edit/<int:organ_problem_specification_id>/',
         edit_organ_problem_specification,
         name='edit_organ_problem_specification'),
    path('adminpanel/organ/delete/problem/<int:organ_problem_specification_id>/', delete_organ_problem_specification,
         name='delete_organ_problem_specification'),
    path('adminpanel/organ/view/problem/<int:organ_problem_specification_id>/', view_organ_problem_specification,
         name='view_organ_problem_specification'),

    # department adminpanel path

    path('adminpanel/add/department/', department_form,
         name="add_department_form"),
    path('adminpanel/store/department/',
         store_department, name="store_department"),
    path('adminpanel/department/list/',
         department_data_view, name="department_list"),
    path('adminpanel/department/update/<int:department_id>/', edit_department_form, name="edit_department_form"),
    path('adminpanel/department/edit/<int:department_id>/', edit_department, name='edit_department'),
    path('adminpanel/department/delete/<int:department_id>/', delete_department, name='delete_department'),

    # department specification adminpanel path

    path('adminpanel/add/department/specification/', department_specification_form,
         name="add_department_specification_form"),
    path('adminpanel/store/department/specification/', store_department_specification,
         name="store_department_specification"),
    path('adminpanel/department/specification/list/',
         department_specification_data_view, name="department_specification_list"),
    path('adminpanel/department/specification/update/<int:department_specification_id>/',
         edit_department_specification_form, name="edit_department_specification_form"),
    path('adminpanel/department/specification/edit/<int:department_specification_id>/',
         edit_department_specification, name='edit_department_specification'),
    path('adminpanel/department/specification/delete/<int:department_specification_id>/',
         delete_department_specification, name='delete_department_specification'),
    path('adminpanel/department/specification/view/<int:department_specification_id>/',
         view_department_specification, name='view_department_specification'),

    # doctor adminpanel path

    path('adminpanel/add/doctor/', doctor_form, name="add_doctor_form"),
    path('adminpanel/add/doctor/work/details/', doctor_work_details_form, name="add_doctor_work_details_form"),

    path('adminpanel/store/doctor/', store_doctor, name="store_doctor"),
    path('adminpanel/store/doctor/work/details/', store_doctor_work_details, name="store_doctor_work_details"),

    path('adminpanel/doctors/list/', doctor_data_view, name="doctor_list"),

    path('adminpanel/doctor/view/<int:doctor_id>/', view_doctor, name='view_doctor_data'),
    path('adminpanel/doctor/update/<int:doctor_id>/', edit_doctor_form, name="edit_doctor_form"),
    path('adminpanel/doctor/delete/<int:doctor_id>/', delete_doctor, name='delete_doctor'),

    # faq adminpanel path
    path('adminpanel/add/faq/', faq_form, name="add_faq_form"),
    path('adminpanel/store/faq/', store_faq, name="store_faq"),
    path('adminpanel/faq/list/', faq_data_view, name="faq_list"),
    path('adminpanel/faq/update/<int:faq_id>/', edit_faq_form, name="edit_faq_form"),
    path('adminpanel/faq/edit/<int:faq_id>/', edit_faq, name='edit_faq'),
    path('adminpanel/faq/delete/<int:faq_id>/', delete_faq, name='delete_faq'),

    path('adminpanel/faq/all/list/<int:id>/', faq_view_created_by, name="faq_all_list"),

    # article adminpanel path
    path('adminpanel/add/article/', article_form, name="add_article_form"),
    path('adminpanel/store/article/', store_article, name="store_article"),
    path('adminpanel/article/list', article_data_view, name="article_list"),

    path('adminpanel/article/all/list/<int:id>/', article_view_created_by, name="article_all_list"),

    # Ajax path
    path('adminpanel/ajax/organ/<int:body_part_id>/', get_organs_by_bodypart, name="get_organs"),
    path('adminpanel/ajax/problem/specification/<int:organ_id>/', get_organ_problem_by_organ,
         name="get_organ_problems"),
    path('adminpanel/ajax/district/<int:division_id>/', get_district_by_division, name="get_districts"),
    path('adminpanel/ajax/upazila/<int:district_id>/', get_upazila_by_district, name="get_upazilas"),

]
