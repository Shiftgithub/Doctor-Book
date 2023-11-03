from django.urls import path, include
from landing.landing.webs import *

urlpatterns = [
    path(
        "",
        include(
            [
                path("doctors/", landing_doctors, name="landing_doctors"),
                path("faq/", landing_faq, name="landing_faq"),
                path(
                    "article/",
                    include(
                        [
                            path("", landing_article, name="landing_article"),
                            path(
                                "view/<int:article_id>/",
                                landing_single_article,
                                name="landing_article_view",
                            ),
                        ]
                    ),
                ),
            ]
        ),
    ),
]
