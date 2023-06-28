from django.urls import path

from adminpanel.views.apis.article_views import *
from adminpanel.views.apis.bodypart_views import *
from adminpanel.views.apis.department_views import *
from adminpanel.views.apis.department_specification_views import *
from adminpanel.views.apis.doctor_views import *
from adminpanel.views.apis.organ_views import *
from adminpanel.views.apis.organ_problem_specification_views import *
from adminpanel.views.apis.faq_views import *
from landing.views.apis.login_views import *

urlpatterns = [

    # bodypart paths
    path('api/add/bodypart/', store_bodypart_data, name="add_bodypart"),
    path('api/bodypart/list/', get_all_bodypart_list, name="bodypart_list"),
    path('api/bodypart/edit/<int:bodypart_id>/', edit_bodypart_data, name='edit_bodypart'),
    path('api/bodypart/delete/<int:bodypart_id>/', softdelete_bodypart_data, name='softdelete_bodypart'),
    path('api/bodypart/view/<int:bodypart_id>/', bodypart_dataview, name='view_bodypart'),

    # organ api paths
    path('api/add/organ/', store_organ_data, name="add_organ"),
    path('api/organs/list/', get_all_organs_list, name="organ_list"),

    path('api/organ/edit/<int:organ_id>/', edit_organ_data, name='edit_organ'),
    path('api/organ/delete/<int:organ_id>/', softdelete_organ_data, name='delete_organ'),
    path('api/organ/view/<int:organ_id>/', organ_dataview, name='view_organ'),

    # organ Problem api paths

    path('api/add/organ/problem/', store_organ_problem_specification_data, name="add_organ_problem_specification"),
    path('api/organ/problem/list/', get_all_organ_problem_specification_list, name="organ_problem_specification_list"),

    path('api/organ/problem/edit/<int:organ_problem_specification_id>/', edit_organ_problem_specification_data,
         name='edit_organ_problem_specification'),
    path('api/organ/problem/delete/<int:organ_problem_specification_id>/', softdelete_organ_problem_specification_data,
         name='delete_organ_problem_specification'),
    path('api/organ/problem/view/<int:organ_problem_specification_id>/', organ_problem_specification_dataview,
         name='view_organ_problem_specification'),

    # department api paths

    path('api/add/department/', store_department_data, name="add_department"),
    path('api/department/list/', get_all_departments_list, name="department_list"),

    path('api/department/edit/<int:department_id>/', edit_department_data, name='edit_department'),
    path('api/department/delete/<int:department_id>/', softdelete_department_data,
         name='delete_department'),
    path('api/department/view/<int:department_id>/', department_dataview, name='view_department'),

    # department specification api paths

    path('api/add/department/specification/', store_department_specification_data,
         name="add_department_specification"),
    path('api/department/specification/list/', get_all_department_specifications_list,
         name="department_specification_list"),

    path('api/department/specification/edit/<int:department_specification_id>/',
         edit_department_specification_data,
         name='edit_department_specification'),
    path('api/department/specification/delete/<int:department_specification_id>/',
         softdelete_department_specification_data,
         name='delete_department_specification'),
    path('api/department/specification/view/<int:department_specification_id>/',
         department_specification_dataview,
         name='view_department_specification'),

    # doctor api paths

    path('api/add/doctor/', store_doctor_data, name="add_doctor"),
    path('api/store/doctor/work/details/', store_doctor_work_details_data, name="store_doctor_work_details"),
    path('api/doctors/list/', get_all_doctors_list, name="doctor_list"),

    # faq api paths

    path('api/add/faq/', store_faq_data, name="add_department"),
    path('api/faq/list/', get_all_faq_list, name="faq_list"),

    path('api/faq/edit/<int:faq_id>/', edit_faq_data, name='edit_faq'),
    path('api/faq/delete/<int:faq_id>/', softdelete_faq_data, name='delete_faq'),
    path('api/faq/view/<int:faq_id>/', faq_dataview, name='view_faq'),

    # article api paths

    path('api/add/article/', store_article_data, name="add_article"),
    path('api/article/list/', get_all_article_list, name="article_list"),

    path('api/login/', checking_authorization, name="login"),

    # api view
    path('api/all/gender/list/', gender_list, name="gender_list"),
    path('api/all/religion/list/', religion_list, name="religion_list"),
    path('api/all/matrimonie/list/', matrimony_list, name="matrimonie_list"),
    path('api/all/blood_group/list/', blood_group_list, name="blood_group_list"),
    path('api/all/division/list/', division_list, name="division_list"),
    path('api/all/district/list/', district_list, name="district_list"),
    path('api/all/upazila/list/', upazila_list, name="upazila_list"),

]
