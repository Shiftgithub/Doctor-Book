from django.urls import path, include
from landing.appointment.urls import *
from landing.landing.urls import *
from landing.prediction.urls import *

urlpatterns = [
    path('', landing_dashboard, name='landing_dashboard'),
    path('', include(
        [
            path('', include('landing.appointment.urls')),
            path('', include('landing.landing.urls')),
            path('', include('landing.prediction.urls')),
        ]
    ),
         ),
]
