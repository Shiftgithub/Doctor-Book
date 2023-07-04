from django.contrib import messages
from django.shortcuts import redirect


def protected_view(view_func):
    def wrapper(request, *args, **kwargs):
        if not request.session.get('user_id'):
            # assigning warning message
            messages.add_message(request, messages.ERROR, "Please login first, to access this page")

            # Redirect the user to the login page or any other appropriate action
            return redirect('login')
        return view_func(request, *args, **kwargs)

    return wrapper
