from django.urls import path, include
from landingpanel.landing.urls import *
from landingpanel.prediction.urls import *


urlpatterns = [
    path("", landing_dashboard, name="landing_dashboard"),
    path(
        "landing/",
        include(
            [
                path("", include("landingpanel.landing.urls")),
                path("", include("landingpanel.prediction.urls")),
            ]
        ),
    ),
]
