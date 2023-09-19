from .views import logout
from django.urls import path

urlpatterns = [
    path('', logout, name='logout'),
]
