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
                # medicine prescription path
                path('medicine-prescription-form/', protected_view(medicine_prescription_form),
<<<<<<< HEAD
                     name='add_medicine_prescription_form'),
=======
                     name='medicine_prescription_form'),
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
                path('store-medicine-prescription/', protected_view(store_medicine_prescription),
                     name='store_medicine_prescription'),
                path('medicine-prescription-list/', protected_view(medicine_prescription_data_view),
                     name='medine_prescription_list'),
<<<<<<< HEAD
=======
                path('medicine-prescription-list-by-patient/',
                     protected_view(medicine_prescription_data_view_by_patient),
                     name='medicine_prescription_data_view_by_patient'),
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
                path('view-medicine-prescription/<int:prescription_id>/', protected_view(view_medicine_prescription),
                     name='medicine_prescription_view'),
                path('print-medicine-prescription/<int:prescription_id>/', protected_view(print_medicine_prescription),
                     name='print_medicine_prescription'),

                # lab test prescription path
                path('labtest-prescription-form/', protected_view(lab_prescription_form), name='lab_prescription_form'),
                path('store-labtest-prescription/', protected_view(store_lab_prescription),
                     name='store_lab_prescription'),
                path('labtest-prescription-list/', protected_view(lab_prescription_data_view),
                     name='lab_prescription_list'),
<<<<<<< HEAD
=======
                path('labtest-prescription-list-by-patient/', protected_view(lab_prescription_data_view_by_patient),
                     name='lab_test_prescription_data_view_by_patient'),
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
                path('view-labtest-prescription/<int:prescription_id>/', protected_view(view_lab_prescription),
                     name='lab_prescription_view'),
                path('print-labtest-prescription/<int:prescription_id>/', protected_view(print_labtest_prescription),
                     name='print_labtest_prescription'),

                # for generate barcode
                path('barcode/', generate_barcode, name='generate_barcode'),
            ]
        ),
    ),
]
