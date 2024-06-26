from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Article

def article_form(request):
    return render(request, 'article/templates/admin/form.html')


def store_article(request):
    user_id = request.session.get('user_id')
    operation_response = store_article_data(request, user_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('article_form')


def get_article_data(request):
    response = get_all_article_list(request)
    all_data = response.data
    return render(request, 'article/templates/admin/list_all.html', {'all_data': all_data})


def view_article_data(request, article_id):
    response_article = article_dataview(request, article_id)
    article_data = response_article.data
    return render(request, 'article/templates/admin/view.html', {'article_data': article_data})


def article_edit_form(request, article_id):
    response_article = article_dataview(request, article_id)
    article_data = response_article.data
    return render(request, 'article/templates/admin/edit.html', {'article_data': article_data})


def edit_article(request, article_id):
    user_id = request.session.get('user_id')
    operation_response = edit_article_data(request, article_id, user_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)

    return redirect('edit_article_form', article_id=article_id)


def delete_article(request, article_id):
    operation_response = delete_article_data(request, article_id)
    message = operation_response.data.get('message')
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, message)
    elif operation_response.data.get('status') == 400:
        messages.add_message(request, messages.ERROR, message)
    elif operation_response.data.get('status') == 403:
        messages.add_message(request, messages.ERROR, message)
    else:
        messages.add_message(request, messages.ERROR, message)
    return redirect('article_list')


def article_list_created_by(request):
    user_id = request.session.get('user_id')
    response = get_all_article_list_created_by(request, user_id)
    all_data = response.data
    return render(request, 'article/templates/doctor/list_all.html', {'all_data': all_data})
