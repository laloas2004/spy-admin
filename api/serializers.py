from rest_framework import serializers
from api.models import Hitman, Hits
from django.contrib.auth import get_user_model

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        exclude = ('password', 'is_boss')
        depth = 0


class HitsSerializer(serializers.ModelSerializer):

    status_display = serializers.CharField(source='get_status_display', required=False)

    class Meta:
        model = Hits
        fields = '__all__'
        depth = 1


class HitmanSerializer(serializers.ModelSerializer):

    user = UserSerializer(many=False)
    status_display = serializers.CharField(source='get_status_display')
    rol_display = serializers.CharField(source='get_rol_display')

    class Meta:
        model = Hitman
        fields = '__all__'
        depth = 1
