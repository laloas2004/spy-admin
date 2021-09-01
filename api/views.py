from django.shortcuts import render
from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view
from .models import ROLES_HITS, STATUS_HITMAN, STATUS_MISSION
from api.models import Hitman, Hits
from api.serializers import HitmanSerializer, HitsSerializer


class HitmanViewSet(viewsets.ModelViewSet):

    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]

    queryset = Hitman.objects.all()
    serializer_class = HitmanSerializer

    def list(self, request):

        if request.user.hitman.rol == '2':
            queryset = Hitman.objects.hitManByManager(request)
        if request.user.id == 1:
            queryset = Hitman.objects.hitManByboss(request)

        serializer = HitmanSerializer(queryset, many=True)

        return Response(serializer.data)


class HitsViewSet(viewsets.ModelViewSet):

    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    serializer_class = HitsSerializer
    queryset = Hits.objects.all()

    def list(self, request):

        if request.user.hitman.rol == '1':
            queryset = Hits.objects.hitsByHitman(request)
        if request.user.hitman.rol == '2':
            queryset = Hits.objects.hitsByManager(request)
        if request.user.id == 1:
            queryset = Hits.objects.hitsByboss(request)

        serializer = HitsSerializer(queryset, many=True)

        return Response(serializer.data)

    def create(self, request, *args, **kwargs):

        return super().create(request, *args, **kwargs)

    def partial_update(self, request, *args, **kwargs):

        return super().partial_update(request, *args, **kwargs)


@api_view()
def get_hitman_status(request):

    return Response(STATUS_HITMAN)


@api_view()
def get_hits_status(request):

    return Response(STATUS_MISSION)


@api_view()
def get_assignee_options(request):

    user = request.user

    if user.hitman.rol == "1":

        queryset = Hitman.objects.filter(id=user.hitman.id)

    if user.hitman.rol == "2":

        queryset = Hitman.objects.filter(status="1").filter(
            manager=user.hitman).exclude(id=user.hitman.id)

    if(user.id == 1):

        queryset = Hitman.objects.filter(status="1").exclude(id=user.hitman.id)

    serializer = HitmanSerializer(queryset, many=True)

    return Response(serializer.data)
