from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.db.models import fields
from api.models import Hits, Hitman
from django import forms


from .forms import UserAdminCreationForm, UserAdminChangeForm

User = get_user_model()

# Remove Group Model from admin. We're not using it.
admin.site.unregister(Group)


class HitmanCreationForm(forms.ModelForm):

    class Meta:
        model = Hitman
        fields = ['name', 'description', 'status', 'rol', 'manager', ]


class HitmanChangeForm(forms.ModelForm):

    manager = forms.ModelChoiceField(
        queryset=Hitman.objects.filter(rol=2), required=False)

    class Meta:
        model = Hitman
        fields = ['name', 'description', 'status', 'rol', 'manager',]


class HitmanAdmin(admin.StackedInline):

    model = Hitman

    form = HitmanChangeForm
    add_form = HitmanCreationForm


class UserAdmin(BaseUserAdmin):
    # The forms to add and change user instances
    form = UserAdminChangeForm
    add_form = UserAdminCreationForm

    # The fields to be used in displaying the User model.
    # These override the definitions on the base UserAdmin
    # that reference specific fields on auth.User.
    list_display = ['email', ]
    list_filter = ['email']
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Permissions', {'fields': ('admin',)}),
    )
    # add_fieldsets is not a standard ModelAdmin attribute. UserAdmin
    # overrides get_fieldsets to use this attribute when creating a user.
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password', 'password_2')}
         ),
    )
    search_fields = ['email']
    ordering = ['email']
    filter_horizontal = ()
    inlines = [HitmanAdmin, ]


admin.site.register(User, UserAdmin)
