from django.urls import path
import doctor.web
from . import web

urlpatterns = [

    # Frontend paths

    path('myadmin/dashboard/', web.dashboard, name="admin_dashboard"),

    # bodypart frontend path

    path('frontend/add/bodypart/', web.bodypart_form, name="add_bodypart_form"),
    path('frontend/store/bodypart/', web.store_bodypart, name="store_bodypart"),
    path('frontend/bodypart/list/', web.bodypart_data_view, name="bodypart_list"),

    # organ frontend path

    path('frontend/add/organ/', web.organ_form, name="add_organ_form"),
    path('frontend/store/organ/', web.store_organ, name="store_organ"),
    path('frontend/organ/list/', web.organ_dataview, name="organ_list"),

    # organ problem frontend path

    path('frontend/add/organ/problem/', web.organ_problem_form,
         name="add_organ_problem_form"),
    path('frontend/store/organ/problem/',
         web.store_organ_problem, name="store_organ_problem"),
    path('frontend/organ/problem/list/',
         web.organ_problem_dataview, name="organ_problem_list"),

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

]
