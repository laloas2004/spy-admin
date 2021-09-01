from django.contrib import admin
from api.models import Hitman, Hits
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import User


class HitsAdmin(admin.ModelAdmin):

    pass


admin.site.register(Hits, HitsAdmin)
