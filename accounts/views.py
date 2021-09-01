from django.shortcuts import render
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.serializers import AuthTokenSerializer
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from django.contrib.auth import authenticate
from django.utils.translation import gettext_lazy as _
from rest_framework import exceptions, serializers


class AuthEmailTokenSerializer(serializers.Serializer):

    email = serializers.EmailField(label=_("Email"))
    password = serializers.CharField(style={'input_type': 'password'},
                                     trim_whitespace=False,
                                     write_only=True)

    def validate(self, data):

        email = data.get('email')
        password = data.get('password')

        if email and password:
            user = authenticate(email=email, password=password)

            if user:
                if not user.is_active:
                    msg = _('User account is disabled.')
                    raise exceptions.ValidationError(msg)
                if user.hitman.status == '2':
                    msg = _('Hitman account is inactive.')
                    raise exceptions.ValidationError(msg)

                if user.hitman.status == '3':
                    msg = _('Hitman account is died.')
                    raise exceptions.ValidationError(msg)

            else:
                msg = _('Unable to log in with provided credentials.')
                raise exceptions.ValidationError(msg)
        else:
            msg = _('Must include "email" and "password".')
            raise exceptions.ValidationError(msg)

        data['user'] = user
        return data

    class Meta:
        exclude = []


class UserAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):

        serializer = AuthEmailTokenSerializer(data=request.data,
                                              context={'request': request})
        serializer.is_valid(raise_exception=True)

        user = serializer.validated_data['user']

        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'user_id': user.pk,
            'email': user.email,
            'rol': user.hitman.rol
        })
