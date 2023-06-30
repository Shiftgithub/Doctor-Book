from adminpanel.models.bodypart_models import *
from adminpanel.serializers.bodypart_serializers import *
from datetime import datetime
from django.db import connection
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.decorators import login_required


def dashboard(request):
    pass
