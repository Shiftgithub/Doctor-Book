from django.urls import path, include
from landing.landing.urls import *
from landing.prediction.urls import *

urlpatterns = [
    path("", landing_dashboard, name="landing_dashboard"),
    path(
        "landing/",
        include(
            [
                path("", include("landing.landing.urls")),
                path("", include("landing.prediction.urls")),
            ]
        ),
    ),
]
