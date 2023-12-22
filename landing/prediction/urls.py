from .webs import *
from django.urls import path, include

urlpatterns = [
    path('doctor-profile/<int:doctor_id>/', doctor_profile, name='doctor_profile'),
    path(
        'prediction-',
        include(
            [
                path('form/', predict_form, name='predict_form'),
                path('', predict, name='prediction'),
                path('list/', prediction_list, name='prediction_list'),
                path('prediction-view/<int:prediction_id>/', view_prediction_data, name='prediction_view'),
            ]
        ),
    ),
]
