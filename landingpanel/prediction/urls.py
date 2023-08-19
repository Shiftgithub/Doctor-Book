from django.urls import path, include
from landingpanel.prediction.webs import *

urlpatterns = [
    path(
        "predict/",
        include(
            [
                path("form/", predict_form, name="predict_form"),
                path("", predict, name="prediction"),
            ]
        ),
    ),
]
