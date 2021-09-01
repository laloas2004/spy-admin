from django.urls import path, include
from rest_framework import routers

from api.views import HitmanViewSet, HitsViewSet, get_hits_status, get_hitman_status, get_assignee_options

router = routers.DefaultRouter()

router.register(r'hitman', HitmanViewSet, basename='Hitman')
router.register(r'hits', HitsViewSet, basename='Hits')

urlpatterns = [
    path('', include(router.urls)),
    path('hitman/status', get_hitman_status),
    path('hits/status', get_hits_status),
    path('hitman/assignees', get_assignee_options),
]
