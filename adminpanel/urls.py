from django.urls import path, include
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
# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # adminpanel path groups
    path('adminpanel/', include([
        # adminpanel dashboard path

        path('dashboard/', protected_view(dashboard), name="admin_dashboard"),
        path('doctor/dashboard/', protected_view(doctor_dashboard), name="doctor_dashboard"),
        path('patient/dashboard/', protected_view(patient_dashboard), name="patient_dashboard"),

        # bodypart adminpanel path

        path('bodypart/', include([
            path('add/', protected_view(bodypart_form), name="add_bodypart_form"),
            path('store/', protected_view(store_bodypart), name="store_bodypart"),
            path('list/', protected_view(bodypart_data_view), name="bodypart_list"),
            path('update/<int:bodypart_id>/', protected_view(edit_bodypart_form), name="edit_bodypart_form"),
            path('edit/<int:bodypart_id>/', protected_view(edit_bodypart), name='edit_bodypart'),
            path('delete/<int:bodypart_id>/', protected_view(delete_bodypart), name='delete_bodypart'),
        ])),

        # organ adminpanel path

        path('organ/', include([
            path('add/', protected_view(organ_form), name="add_organ_form"),
            path('store/', protected_view(store_organ), name="store_organ"),
            path('list/', protected_view(organ_data_view), name="organ_list"),
            path('update/<int:organ_id>/', protected_view(edit_organ_form), name="edit_organ_form"),
            path('edit/<int:organ_id>/', protected_view(edit_organ), name='edit_organ'),
            path('delete/<int:organ_id>/', protected_view(delete_organ), name='delete_organ'),

        ])),

        # organ problem adminpanel path

        path('organ/problem/', include([
            path('add/', protected_view(organ_problem_specification_form),
                 name="add_organ_problem_specification_form"),
            path('store/', protected_view(store_organ_problem_specification),
                 name="store_organ_problem_specification"),
            path('list/', protected_view(organ_problem_specification_data_view),
                 name="organ_problem_specification_list"),
            path('update/<int:organ_problem_specification_id>/',
                 protected_view(edit_organ_problem_specification_form), name="edit_organ_problem_specification_form"),
            path('edit/<int:organ_problem_specification_id>/',
                 protected_view(edit_organ_problem_specification), name='edit_organ_problem_specification'),
            path('delete/<int:organ_problem_specification_id>/',
                 protected_view(delete_organ_problem_specification), name='delete_organ_problem_specification'),
            path('view/<int:organ_problem_specification_id>/', protected_view(view_organ_problem_specification),
                 name='view_organ_problem_specification'),

        ])),

        path('organ/problem/specification/', include([
            path('add/', protected_view(organ_problem_specification_form),
                 name="add_organ_problem_specification_form"),
            path('store/', protected_view(store_organ_problem_specification),
                 name="store_organ_problem_specification"),
            path('list/', protected_view(organ_problem_specification_data_view),
                 name="organ_problem_specification_list"),
            path('update/<int:organ_problem_specification_id>/',
                 protected_view(edit_organ_problem_specification_form), name="edit_organ_problem_specification_form"),
            path('edit/<int:organ_problem_specification_id>/',
                 protected_view(edit_organ_problem_specification), name='edit_organ_problem_specification'),
            path('delete/<int:organ_problem_specification_id>/',
                 protected_view(delete_organ_problem_specification), name='delete_organ_problem_specification'),
            path('view/<int:organ_problem_specification_id>/', protected_view(view_organ_problem_specification),
                 name='view_organ_problem_specification'),

        ])),

        # department adminpanel path
        path('department/', include([
            path('add/', protected_view(department_form), name="add_department_form"),
            path('store/', protected_view(store_department), name="store_department"),
            path('list/', protected_view(department_data_view), name="department_list"),
            path('update/<int:department_id>/', protected_view(edit_department_form), name="edit_department_form"),
            path('edit/<int:department_id>/', protected_view(edit_department), name='edit_department'),
            path('delete/<int:department_id>/', protected_view(delete_department), name='delete_department'),
        ])),

        # department specification adminpanel path

        path('department/specification/', include([
            path('add/', protected_view(department_specification_form),
                 name="add_department_specification_form"),
            path('store/', protected_view(store_department_specification),
                 name="store_department_specification"),
            path('list/', protected_view(department_specification_data_view),
                 name="department_specification_list"),
            path('update/<int:department_specification_id>/',
                 protected_view(edit_department_specification_form), name="edit_department_specification_form"),
            path('edit/<int:department_specification_id>/',
                 protected_view(edit_department_specification), name='edit_department_specification'),
            path('delete/<int:department_specification_id>/',
                 protected_view(delete_department_specification), name='delete_department_specification'),
            path('view/<int:department_specification_id>/',
                 protected_view(view_department_specification), name='view_department_specification'),
        ])),

        # doctor adminpanel path

        path('doctor/', include([
            path('add/', protected_view(doctor_form), name="add_doctor_form"),
            path('work/details/add/', protected_view(doctor_work_details_form),
                 name="add_doctor_work_details_form"),

            path('store/', protected_view(store_doctor), name="store_doctor"),
            path('work_details/store/', protected_view(store_doctor_work_details), name="store_doctor_work_details"),

            path('list/', protected_view(doctor_data_view), name="doctor_list"),

            path('view/<int:doctor_id>/', protected_view(view_doctor), name='view_doctor_data'),
            path('update/<int:doctor_id>/', protected_view(edit_doctor_form), name="edit_doctor_form"),
            path('edit/<int:doctor_id>/', protected_view(edit_doctor), name='edit_doctor'),
            path('delete/<int:doctor_id>/', protected_view(delete_doctor), name='delete_doctor'),
        ])),

        # faq adminpanel path

        path('faq/', include([
            path('add/', protected_view(faq_form), name="add_faq_form"),
            path('store/', protected_view(store_faq), name="store_faq"),
            path('list/', protected_view(faq_data_view), name="faq_list"),
            path('update/<int:faq_id>/', protected_view(edit_faq_form), name="edit_faq_form"),
            path('edit/<int:faq_id>/', protected_view(edit_faq), name='edit_faq'),
            path('delete/<int:faq_id>/', protected_view(delete_faq), name='delete_faq'),

            path('faq/all/list/<int:id>/', protected_view(faq_view_created_by), name="faq_all_list"),
        ])),

        # article adminpanel path

        path('article/', include([
            path('add/', protected_view(article_form), name="add_article_form"),
            path('store/', protected_view(store_article), name="store_article"),
            path('list/', protected_view(article_data_view), name="article_list"),

            path('article/all/list/<int:id>/', article_view_created_by, name="article_all_list"),
        ])),

        # Ajax path

        path('ajax/', include([
            path('organ/<int:body_part_id>/', get_organs_by_bodypart, name="get_organs"),
            path('problem/specification/<int:organ_id>/', get_organ_problem_by_organ,
                 name="get_organ_problems"),
            path('district/<int:division_id>/', get_district_by_division, name="get_districts"),
            path('upazila/<int:district_id>/', get_upazila_by_district, name="get_upazilas"),
        ])),

    ])),
]
