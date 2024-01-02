from .webs import *
from django.urls import path, include
<<<<<<< HEAD
=======
from core.login_decorators import protected_view
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c

urlpatterns = [
    path('doctor-profile/<int:doctor_id>/', doctor_profile, name='doctor_profile'),
    path(
<<<<<<< HEAD
        'predict-',
=======
        'prediction-',
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
        include(
            [
                path('form/', predict_form, name='predict_form'),
                path('', predict, name='prediction'),
                path('list/', protected_view(prediction_list), name='prediction_list'),
                path('prediction-view/<int:prediction_id>/', protected_view(view_prediction_data),
                     name='prediction_view'),
            ]
        ),
    ),
]
