from django.urls import path, include

from admin.article.views import *
from admin.bodypart.views import *
from admin.department.views import *
from admin.department_speci.views import *
from admin.doctor.views import *
from admin.organ.views import *
from admin.organ_problem_speci.views import *
from admin.faq.views import *
from admin.personal_data.views import *
from admin.authentication.login.views import *
from core.login_decorators import protected_view

urlpatterns = [
    # api path groups
    # path('api/', include([
    #
    #     # body_part api path
    #
    #     path('body_part/', include([
    #         path('add/', protected_view(store_body_part_data), name='add_body_part'),
    #         path('list/', protected_view(get_all_body_part_list), name='body_part_list'),
    #         path('edit/<int:body_part_id>/', protected_view(edit_body_part_data), name='edit_body_part'),
    #         path('delete/<int:body_part_id>/', protected_view(delete_body_part_data), name='delete_body_part_data'),
    #         path('view/<int:body_part_id>/', protected_view(get_body_part_data), name='view_body_part'),
    #     ])),
    #
    #     # organ api path
    #
    #     path('organ/', include([
    #         path('add/', protected_view(store_organ_data), name='add_organ'),
    #         path('list/', protected_view(get_all_organs_list), name='organ_list'),
    #
    #         path('edit/<int:organ_id>/', protected_view(edit_organ_data), name='edit_organ'),
    #         path('delete/<int:organ_id>/', protected_view(softdelete_organ_data), name='delete_organ'),
    #         path('view/<int:organ_id>/', protected_view(organ_dataview), name='view_organ'),
    #
    #     ])),
    #
    #     # organ problem api path
    #
    #     path('organ/problem/specification/', include([
    #         path('add/', protected_view(store_organ_problem_specification_data),
    #              name='add_organ_problem_specification'),
    #         path('list/', protected_view(get_all_organ_problem_specification_list),
    #              name='organ_problem_specification_list'),
    #
    #         path('edit/<int:organ_problem_specification_id>/', protected_view(edit_organ_problem_specification_data),
    #              name='edit_organ_problem_specification'),
    #         path('delete/<int:organ_problem_specification_id>/',
    #              protected_view(softdelete_organ_problem_specification_data),
    #              name='delete_organ_problem_specification'),
    #         path('view/<int:organ_problem_specification_id>/', protected_view(organ_problem_specification_dataview),
    #              name='view_organ_problem_specification'),
    #
    #     ])),
    #
    #     # department api path
    #     path('department/', include([
    #         path('add/', protected_view(store_department_data), name='add_department'),
    #         path('list/', protected_view(get_all_departments_list), name='department_list'),
    #
    #         path('edit/<int:department_id>/', protected_view(edit_department_data), name='edit_department'),
    #         path('delete/<int:department_id>/', protected_view(softdelete_department_data),
    #              name='delete_department'),
    #         path('view/<int:department_id>/', protected_view(department_dataview), name='view_department'),
    #     ])),
    #
    #     # department specification api path
    #
    #     path('department/specification/', include([
    #         path('add/', protected_view(store_department_specification_data),
    #              name='add_department_specification'),
    #         path('list/', protected_view(get_all_department_specifications_list),
    #              name='department_specification_list'),
    #
    #         path('edit/<int:department_specification_id>/',
    #              protected_view(edit_department_specification_data),
    #              name='edit_department_specification'),
    #         path('delete/<int:department_specification_id>/',
    #              protected_view(softdelete_department_specification_data),
    #              name='delete_department_specification'),
    #         path('view/<int:department_specification_id>/',
    #              protected_view(department_specification_dataview),
    #              name='view_department_specification'),
    #     ])),
    #
    #     # doctor api path
    #
    #     path('doctor/', include([
    #         path('add/', protected_view(store_doctor_data), name='add_doctor'),
    #         path('work/details/add/', protected_view(work_details_store), name='store_doctor_work_details'),
    #         path('list/', get_all_doctors_list, name='doctor_list'),
    #         path('view/<int:id>/', protected_view(doctor_data), name='view_doctor'),
    #         path('delete/<int:doctor_id>/', protected_view(softdelete_doctor_data), name='delete_doctor'),
    #     ])),
    #     # faq api path
    #
    #     path('faq/', include([
    #         path('add/', protected_view(store_faq_data), name='add_department'),
    #         path('list/', get_all_faq_list, name='faq_list'),
    #         path('edit/<int:faq_id>/', protected_view(edit_faq_data), name='edit_faq'),
    #         path('delete/<int:faq_id>/', protected_view(softdelete_faq_data), name='delete_faq'),
    #         path('view/<int:faq_id>/', protected_view(faq_dataview), name='view_faq'),
    #     ])),
    #
    #     # article api path
    #
    #     path('article/', include([
    #         path('add/', protected_view(store_article_data), name='add_article'),
    #         path('list/', get_all_article_list, name='article_list'),
    #         path('edit/<int:article_id>/', protected_view(edit_article_data), name='edit_article'),
    #         path('delete/<int:article_id>/', protected_view(delete_article_data), name='delete_article'),
    #         path('view/<int:article_id>/', protected_view(article_dataview), name='view_article'),
    #     ])),
    #
    #     path('all/', include([
    #         path('gender/list/', gender_list, name='gender_list'),
    #         path('religion/list/', religion_list, name='religion_list'),
    #         path('matrimonie/list/', matrimony_list, name='matrimonie_list'),
    #         path('blood_group/list/', blood_group_list, name='blood_group_list'),
    #         path('division/list/', division_list, name='division_list'),
    #         path('district/list/', district_list, name='district_list'),
    #         path('upazila/list/', upazila_list, name='upazila_list'),
    #     ])),
    #     # for doctor side
    #     path('faq/all/list/<int:id>/', protected_view(get_all_faq_list_created_by), name='all_faq_list_created_by'),
    #     # article api paths
    #
    #     # for doctor side
    #     path('article/all/list/<int:id>/',
    #          protected_view(get_all_article_list_created_by), name='all_article_list_created_by'),
    #
    #     path('login/', checking_authorization, name='login'),
    # ])),
]
