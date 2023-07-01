from adminpanel.views.apis.article_views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Article

def article_form(request):
    return render(request, 'admin/article/form.html')


def store_article(request):
    operation_response = store_article_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             "Article data stored successfully")
    else:
        messages.add_message(request, messages.ERROR,
                             "Error in storing Article data")

    return redirect('add_article_form')


def article_data_view(request):
    response = get_all_article_list(request)
    all_data = response.data
    return render(request, 'admin/article/list_all.html', {'all_data': all_data})


def article_view_created_by(request, id):
    response = get_all_article_list_created_by(request, id)
    all_data = response.data
    return render(request, 'doctor/article/list_all.html', {'all_data': all_data})
