from .webs import *
from django.urls import path, include
from core.login_decorators import protected_view

urlpatterns = [
    # medicine adminpanel path
    path(
        '',
        include(
            [
                path('form/', protected_view(medicine_form), name='medicine_form'),
                path('store/', protected_view(store_medicine), name='store_medicine'),
                path('list/', protected_view(medicine_data_view), name='medicine_list'),
                path('view/<int:medicine_id>/', protected_view(view_medicine), name='view_medicine_data'),
                path('update/<int:medicine_id>/', protected_view(edit_medicine_form), name='edit_medicine_form'),
                path('edit/<int:medicine_id>/', protected_view(edit_medicine), name='edit_medicine', ),
                path('delete/<int:medicine_id>/', protected_view(delete_medicine), name='delete_medicine', ),
            ]
        ),
    ),
]
