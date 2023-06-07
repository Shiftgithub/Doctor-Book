from django.urls import path
import doctor.web
from . import web

urlpatterns = [

    # Frontend paths

    path('myadmin/dashboard/', web.dashboard, name="admin_dashboard"),

    # bodypart frontend path

    path('frontend/add/bodypart/', web.bodypart_form, name="add_bodypart_form"),
    path('frontend/store/bodypart/', web.store_bodypart, name="store_bodypart"),

    path('frontend/bodypart/update/<int:bodypart_id>/', web.edit_bodypart_form, name="edit_bodypart_form"),
    path('frontend/bodypart/edit/<int:bodypart_id>/', web.edit_bodypart, name='edit_bodypart'),
    path('frontend/bodypart/delete/<int:bodypart_id>/', web.delete_bodypart, name='delete_bodypart'),
    path('frontend/bodypart/view/<int:bodypart_id>/', web.view_bodypart, name='view_bodypart'),
    
    path('frontend/bodypart/list/', web.bodypart_data_view, name="bodypart_list"),

    # organ frontend path

    path('frontend/add/organ/', web.organ_form, name="add_organ_form"),
    path('frontend/store/organ/', web.store_organ, name="store_organ"),
    path('frontend/organ/list/', web.organ_dataview, name="organ_list"),

    path('frontend/organ/update/<int:organ_id>/', web.edit_organ_form, name="edit_organ_form"),
    path('frontend/organ/edit/<int:organ_id>/', web.edit_organ, name='edit_organ'),
    path('frontend/organ/delete/<int:organ_id>/', web.delete_organ, name='delete_organ'),
    path('frontend/organ/view/<int:organ_id>/', web.view_organ, name='view_organ'),


    # organ problem frontend path

    path('frontend/add/organ/problem/', web.organ_problem_form,
         name="add_organ_problem_form"),
    path('frontend/store/organ/problem/',
         web.store_organ_problem, name="store_organ_problem"),
    path('frontend/organ/problem/list/',
         web.organ_problem_dataview, name="organ_problem_list"),

    path('frontend/organ/problem/update/<int:organ_problem_id>/', web.edit_organ_problem_form, name="edit_organ_problem_form"),
    path('frontend/organ/problem/edit/<int:organ_problem_id>/', web.edit_organ_problem, name='edit_organ_problem'),
    path('frontend/organ/delete/problem/<int:organ_problem_id>/', web.delete_organ_problem, name='delete_organ_problem'),
    path('frontend/organ/view/problem/<int:organ_problem_id>/', web.view_organ_problem, name='view_organ_problem'),

    # problem specification frontend path

    path('frontend/add/problem/specification/', web.problem_specification_form,
         name="add_problem_specification_form"),
    path('frontend/store/problem/specification/',
         web.store_problem_specification, name="store_problem_specification"),
    path('frontend/problem/specification/list/',
         web.problem_specification_dataview, name="problem_specification_list"),

    # department frontend path

    path('frontend/add/department/', web.department_form,
         name="add_department_form"),
    path('frontend/store/department/',
         web.store_department, name="store_department"),
    path('frontend/department/list/',
         web.department_dataview, name="department_list"),

    path('frontend/department/update/<int:department_id>/', web.edit_department_form, name="edit_department_form"),
    path('frontend/department/edit/<int:department_id>/', web.edit_department, name='edit_department'),
    path('frontend/department/delete/<int:department_id>/', web.delete_department, name='delete_department'),
    path('frontend/department/view/<int:department_id>/', web.view_department, name='view_department'),
    # department specification frontend path

    path('frontend/add/department/specification/', web.department_specification_form,
         name="add_department_specification_form"),
    path('frontend/store/department/specification/', web.store_department_specification,
         name="store_department_specification"),
    path('frontend/department/specification/list/',
         web.department_specification_dataview, name="department_specification_list"),

    # doctor frontend path

    path('frontend/add/doctor/', doctor.web.doctor_form, name="add_doctor_form"),
    path('frontend/store/doctor/', doctor.web.store_doctor, name="store_doctor"),
    path('frontend/doctors/list/', doctor.web.doctor_dataview, name="doctor_list"),

     # faq frontend path

    path('frontend/add/faq/', web.faq_form, name="add_faq_form"),
    path('frontend/store/faq/', web.store_faq, name="store_faq"),
    path('frontend/faq/list/', web.faq_dataview, name="faq_list"),

    path('frontend/faq/update/<int:faq_id>/', web.edit_faq_form, name="edit_faq_form"),
    path('frontend/faq/edit/<int:faq_id>/', web.edit_faq, name='edit_faq'),
    path('frontend/faq/delete/<int:faq_id>/', web.delete_faq, name='delete_faq'),
    path('frontend/faq/view/<int:faq_id>/', web.view_faq, name='view_faq'),
    
     # article frontend path

    path('frontend/add/article/', web.article_form, name="add_article_form"),
    path('frontend/store/article/', web.store_article, name="store_article"),
    path('frontend/article/list', web.article_dataview, name="article_list"),

    

]
