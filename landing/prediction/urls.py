from django.urls import path, include
from .webs import *

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
