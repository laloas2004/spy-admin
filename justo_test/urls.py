"""justo_test URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from django.conf import settings
from django.conf.urls.static import static
from front import views as frontend_views
from accounts.views import UserAuthToken

urlpatterns = [
    path('api/v1/', include('api.urls')),
    path('admin/', admin.site.urls),
    path('auth/login/', UserAuthToken.as_view()),
    re_path(r'^(?P<path>.*)/$', frontend_views.index),
    path('', frontend_views.index),

] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


admin.site.site_header = "Hits Admin"
admin.site.site_title = "DB"
admin.site.index_title = "DB"
