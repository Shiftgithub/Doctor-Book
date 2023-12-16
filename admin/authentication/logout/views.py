from django.shortcuts import redirect
from rest_framework.decorators import api_view


def logout(request):
    request.session.flush()
    return redirect('login')
