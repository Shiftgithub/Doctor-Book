from .views import *
from django.contrib import messages
from django.shortcuts import render, redirect


# Article

def article_form(request):
    return render(request, 'article/templates/admin/form.html')


def store_article(request):
    operation_response = store_article_data(request)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO,
                             'Article data stored successfully')
    else:
        messages.add_message(request, messages.ERROR,
                             'Error in storing Article data')

    return redirect('add_article_form')


def article_data_view(request):
    response = get_all_article_list(request)
    all_data = response.data
    return render(request, 'article/templates/admin/list_all.html', {'all_data': all_data})


def view_article(request, article_id):
    response_article = article_dataview(request, article_id)
    article_data = response_article.data
    return render(request, 'article/templates/admin/view.html', {'article_data': article_data})


def edit_article_form(request, article_id):
    response_article = article_dataview(request, article_id)
    article_data = response_article.data
    return render(request, 'article/templates/admin/edit.html', {'article_data': article_data})


def edit_article(request, article_id):
    operation_response = edit_article_data(request, article_id)

    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'Article data edited successfully')
    else:
        messages.add_message(request, messages.ERROR, 'Error editing Article data')

    return redirect('edit_article_form', article_id=article_id)


def delete_article(request, article_id):
    operation_response = softdelete_article_data(request, article_id)
    if operation_response.data.get('status') == 200:
        messages.add_message(request, messages.INFO, 'Article data deleted successfully')
    else:
        messages.add_message(request, messages.ERROR, 'Error deleting Article data')
    return redirect('article_list')


def article_view_created_by(request, id):
    response = get_all_article_list_created_by(request, id)
    all_data = response.data
    return render(request, 'article/templates/doctor/list_all.html', {'all_data': all_data})
