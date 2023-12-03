from .webs import *
from django.urls import path, include
# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # prescription path
    path(
        '',
        include(
            [
                path('form/', protected_view(prescription_form), name='add_prescription_form'),
                path('lab-form/', protected_view(lab_prescription_form), name='lab_prescription_form'),

                path('store-medicine/', protected_view(store_prescription), name='store_medicine_prescription'),

                path('store-lab/', protected_view(store_lab_prescription), name='store_lab_prescription'),
                path('medicine-list/', protected_view(medicine_prescription_data_view),
                     name='medine_prescription_list'),
                path('labtest-list/', protected_view(lab_prescription_data_view), name='lab_prescription_list'),

                path('medicine-view/<int:prescription_id>/', protected_view(view_medicine_prescription),
                     name='medicine_view'),
                path('lab-view/<int:prescription_id>/', protected_view(view_lab_prescription), name='lab_view'),

                path('update/<int:prescription_id>/', protected_view(edit_prescription_form),
                     name='edit_prescription_form'),
                path('edit/<int:prescription_id>/', protected_view(edit_prescription), name='edit_prescription'),
                path('delete/<int:prescription_id>/', protected_view(delete_prescription),
                     name='delete_prescription'),
                path('barcode/', generate_barcode, name='generate_barcode'),
            ]
        ),
    ),
]
