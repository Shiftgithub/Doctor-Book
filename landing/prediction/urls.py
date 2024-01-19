from .webs import *
from django.urls import path, include
from core.login_decorators import protected_view

urlpatterns = [
    path(
        'prediction-',
        include(
            [
                path('form/', predict_form, name='predict_form'),
                path('', predict, name='prediction'),
                path('list/', protected_view(prediction_list), name='prediction_list'),
                path('view/<int:prediction_id>/', protected_view(view_prediction_data),
                     name='prediction_view'),
            ]
        ),
    ),
]
