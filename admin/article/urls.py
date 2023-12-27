from .webs import *
from django.urls import path, include

# To protect admin panel paths from unauthenticated users
from core.login_decorators import protected_view

urlpatterns = [
    # article path
    path(
        '',
        include(
            [
                path('form/', protected_view(article_form), name='article_form'),
                path('store/', protected_view(store_article), name='store_article'),

                path('list/', protected_view(get_article_data), name='article_list'),
                path('view/<int:article_id>/', protected_view(view_article_data), name='view_article_data'),

                path('edit-form/<int:article_id>/', protected_view(article_edit_form), name='edit_article_form'),
                path('edit/<int:article_id>/', protected_view(edit_article), name='edit_article'),

                path('delete/<int:article_id>/', protected_view(delete_article), name='delete_article'),

                path('list-by/', article_list_created_by, name='article_all_list'),
            ]
        ),
    ),
]
