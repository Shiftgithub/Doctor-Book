from django.contrib import admin
from django.urls import path, include

<<<<<<< HEAD
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('api.urls')),
    path('', include('admin.urls.urls')),
    path('', include('landing.url.urls')),
]
=======
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('admin.urls.urls')),
    path('', include('landing.url.urls')),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c
