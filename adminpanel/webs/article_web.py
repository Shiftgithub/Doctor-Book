from . import views
from .models import *
from datetime import datetime
from django.contrib import messages
from django.shortcuts import render, redirect


# Article

def article_form(request):
    return render(request, 'admin/article/form.html')


def store_article(request):
    operation_response = views.article_views_store_article_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             "Article data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Article data")

    return redirect('add_article_form')


def article_dataview(request):
    response = views.article_views.get_all_article_list(request)
    all_data = response.data
    return render(request, 'admin/article/list_all.html', {'all_data': all_data})