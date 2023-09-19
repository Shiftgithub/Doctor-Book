from django.urls import path, include
from admin.article.webs import *

# To protect admin panel paths from unauthenticated users
from backend.login_decorators import protected_view

urlpatterns = [
    # article adminpanel path
    path(
        '',
        include(
            [
                path(
                    'add/',
                    protected_view(article_form),
                    name='add_article_form',
                ),
                path(
                    'store/',
                    protected_view(store_article),
                    name='store_article',
                ),
                path(
                    'list/',
                    protected_view(article_data_view),
                    name='article_list',
                ),
                path(
                    'view/<int:article_id>/',
                    protected_view(view_article),
                    name='view_article_data',
                ),
                path(
                    'update/<int:article_id>/',
                    protected_view(edit_article_form),
                    name='edit_article_form',
                ),
                path(
                    'edit/<int:article_id>/',
                    protected_view(edit_article),
                    name='edit_article',
                ),
                path(
                    'delete/<int:article_id>/',
                    protected_view(delete_article),
                    name='delete_article',
                ),
                path(
                    'list/<int:id>/',
                    article_view_created_by,
                    name='article_all_list',
                ),
            ]
        ),
    ),
]
