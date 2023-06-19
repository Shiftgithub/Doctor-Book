from django.urls import path
from adminpanel.webs.article_web import *
from adminpanel.webs.bodypart_web import *
from adminpanel.webs.dashboard_web import *
from adminpanel.webs.doctor_web import *

from adminpanel.webs.department__web import *
from adminpanel.webs.department_specification_web import *
from adminpanel.webs.organ_web import *
from adminpanel.webs.organ_problem_web import *
from adminpanel.webs.faq_web import *
from adminpanel.webs.problem_specification_web import *

from adminpanel.views.ajax_views import *

urlpatterns = [

    # Frontend paths

    path('myadmin/dashboard/', dashboard, name="admin_dashboard"),

    # bodypart frontend path

    path('frontend/add/bodypart/', bodypart_form, name="add_bodypart_form"),
    path('frontend/store/bodypart/', store_bodypart, name="store_bodypart"),
    path('frontend/bodypart/list/', bodypart_data_view, name="bodypart_list"),

    path('frontend/bodypart/update/<int:bodypart_id>/', edit_bodypart_form, name="edit_bodypart_form"),
    path('frontend/bodypart/edit/<int:bodypart_id>/', edit_bodypart, name='edit_bodypart'),
    path('frontend/bodypart/delete/<int:bodypart_id>/', delete_bodypart, name='delete_bodypart'),

    # organ frontend path

    path('frontend/add/organ/', organ_form, name="add_organ_form"),
    path('frontend/store/organ/', store_organ, name="store_organ"),
    path('frontend/organ/list/', organ_data_view, name="organ_list"),

    path('frontend/organ/update/<int:organ_id>/', edit_organ_form, name="edit_organ_form"),
    path('frontend/organ/edit/<int:organ_id>/', edit_organ, name='edit_organ'),
    path('frontend/organ/delete/<int:organ_id>/', delete_organ, name='delete_organ'),

    # organ problem frontend path

    path('frontend/add/organ/problem/', organ_problem_form,
         name="add_organ_problem_form"),
    path('frontend/store/organ/problem/',
         store_organ_problem, name="store_organ_problem"),
    path('frontend/organ/problem/list/',
         organ_problem_data_view, name="organ_problem_list"),

    path('frontend/organ/problem/update/<int:organ_problem_id>/', edit_organ_problem_form,
         name="edit_organ_problem_form"),
    path('frontend/organ/problem/edit/<int:organ_problem_id>/', edit_organ_problem, name='edit_organ_problem'),
    path('frontend/organ/delete/problem/<int:organ_problem_id>/', delete_organ_problem,
         name='delete_organ_problem'),
    path('frontend/organ/view/problem/<int:organ_problem_id>/', view_organ_problem, name='view_organ_problem'),

    # problem specification frontend path

    path('frontend/add/problem/specification/', problem_specification_form,
         name="add_problem_specification_form"),
    path('frontend/store/problem/specification/',
         store_problem_specification, name="store_problem_specification"),
    path('frontend/problem/specification/list/',
         problem_specification_data_view, name="problem_specification_list"),

    path('frontend/problem/specification/update/<int:problem_specification_id>/', edit_problem_specification_form,
         name="edit_problem_specification_form"),
    path('frontend/problem/specification/edit/<int:problem_specification_id>/', edit_problem_specification,
         name='edit_problem_specification'),
    path('frontend/problem/specification/delete/<int:problem_specification_id>/', delete_problem_specification,
         name='delete_problem_specification'),
    path('frontend/problem/specification/view/<int:problem_specification_id>/', view_problem_specification,
         name='view_problem_specification'),

    # department frontend path

    path('frontend/add/department/', department_form,
         name="add_department_form"),
    path('frontend/store/department/',
         store_department, name="store_department"),
    path('frontend/department/list/',
         department_data_view, name="department_list"),

    path('frontend/department/update/<int:department_id>/', edit_department_form, name="edit_department_form"),
    path('frontend/department/edit/<int:department_id>/', edit_department, name='edit_department'),
    path('frontend/department/delete/<int:department_id>/', delete_department, name='delete_department'),

    # department specification frontend path

    path('frontend/add/department/specification/', department_specification_form,
         name="add_department_specification_form"),
    path('frontend/store/department/specification/', store_department_specification,
         name="store_department_specification"),
    path('frontend/department/specification/list/',
         department_specification_data_view, name="department_specification_list"),

    path('frontend/department/specification/update/<int:department_specification_id>/',
         edit_department_specification_form, name="edit_department_specification_form"),
    path('frontend/department/specification/edit/<int:department_specification_id>/',
         edit_department_specification, name='edit_department_specification'),
    path('frontend/department/specification/delete/<int:department_specification_id>/',
         delete_department_specification, name='delete_department_specification'),
    path('frontend/department/specification/view/<int:department_specification_id>/',
         view_department_specification, name='view_department_specification'),

    # doctor frontend path

    path('frontend/add/doctor/', doctor_form, name="add_doctor_form"),
    path('frontend/store/doctor/', store_doctor, name="store_doctor"),
    path('frontend/doctors/list/', doctor_data_view, name="doctor_list"),

    # faq frontend path

    path('frontend/add/faq/', faq_form, name="add_faq_form"),
    path('frontend/store/faq/', store_faq, name="store_faq"),
    path('frontend/faq/list/', faq_data_view, name="faq_list"),

    path('frontend/faq/update/<int:faq_id>/', edit_faq_form, name="edit_faq_form"),
    path('frontend/faq/edit/<int:faq_id>/', edit_faq, name='edit_faq'),
    path('frontend/faq/delete/<int:faq_id>/', delete_faq, name='delete_faq'),

    # article frontend path

    path('frontend/add/article/', article_form, name="add_article_form"),
    path('frontend/store/article/', store_article, name="store_article"),
    path('frontend/article/list', article_data_view, name="article_list"),

    # Ajax path
    path('frontend/ajax/organ/<int:body_part_id>/', get_organs_by_bodypart, name="get_organs"),
    path('frontend/ajax/organ/problem/<int:organ_id>/', get_organ_problem_by_organ, name="get_organ_problems"),
    path('frontend/ajax/problem/specification/<int:organ_problem_id>/', get_specification_by_organ_problem,
         name="get_specification"),
]
