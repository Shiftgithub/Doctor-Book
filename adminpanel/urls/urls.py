from django.urls import path, include
from backend.login_decorators import protected_view
from adminpanel.ajax.urls import *
from adminpanel.article.urls import *
from adminpanel.bodypart.urls import *
from adminpanel.dashboard.urls import *
from adminpanel.department.urls import *
from adminpanel.department_speci.urls import *
from adminpanel.doctor.urls import *
from adminpanel.faq.urls import *
from adminpanel.organ.urls import *
from adminpanel.organ_problem_speci.urls import *
from adminpanel.patient.urls import *
from adminpanel.user.urls import *

urlpatterns = [ 
    # adminpanel path groups
    path("adminpanel/", include([
        path("ajax/", include("adminpanel.ajax.urls")),
        path("article/", include("adminpanel.article.urls")),
        path("bodypart/", include("adminpanel.bodypart.urls")),
        path("dashboard/", include("adminpanel.dashboard.urls")),
        path("department/", include("adminpanel.department.urls")),
        path("department_speci/", include("adminpanel.department_speci.urls")),
        path("doctor/", include("adminpanel.doctor.urls")),
        path("faq/", include("adminpanel.faq.urls")),
        path("organ/", include("adminpanel.organ.urls")),
        path("organ/problem/specification/", include("adminpanel.organ_problem_speci.urls")),
        path("patient/", include("adminpanel.patient.urls")),
        path("user/details/", include("adminpanel.user.urls")),

    ])),
    
    # Include landing app URL patterns here
]
