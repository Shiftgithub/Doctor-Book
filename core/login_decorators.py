from django.contrib import messages
from django.shortcuts import redirect
from admin.constants.constants import *


def protected_view(view_func):
    def wrapper(request, *args, **kwargs):
        if request.session.get('user_id'):
            role = request.session.get('user_role')
            if role == ROLE_ADMIN:
                # Logic for admin role
                return view_func(request, *args, **kwargs)
            elif role == ROLE_DOCTOR:
                # Logic for doctor role
                return view_func(request, *args, **kwargs)
            elif role == ROLE_PATIENT:
                # Logic for patient role
                return view_func(request, *args, **kwargs)
            else:
                # Unauthorized role, show an error message
                messages.add_message(request, messages.ERROR, "You are not authorized to access this page")
                return redirect('login')
        else:
            # User is not logged in, show an error message and redirect to login
            messages.add_message(request, messages.ERROR, "Please login first to access this page")
            return redirect('login')

    return wrapper
