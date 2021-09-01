from django.db import models
from django.contrib.auth import get_user_model
from django.utils.translation import ugettext_lazy as _
from django.db.models import fields, manager
from django.conf import settings
from api.middleware.get_username import get_request


User = get_user_model()

ROLES_HITS = [('1', 'HITMAN'), ('2', 'MANAGER')]

STATUS_HITMAN = [('1', 'ACTIVE'),
                 ('2', 'INACTIVE'),
                 ('3', 'DIED')]
STATUS_MISSION = [('1', 'ASSIGNED'),
                  ('2', 'FAILED ASSIGNED'),
                  ('3', 'COMPLETED')]


class HitsManager(models.Manager):

    def hitsByHitman(self, request):

        user = request.user

        queryset = super().get_queryset().filter(hitman=user.hitman)

        return queryset

    def hitsByManager(self, request):

        user = request.user

        queryset = super().get_queryset().select_related(
            'hitman').filter(hitman__manager=user.hitman)

        return queryset

    def hitsByboss(self, request):

        user = request.user

        queryset = super().get_queryset()

        return queryset


class HitManManager(models.Manager):

    def hitManByManager(self, request):

        user = request.user

        queryset = super().get_queryset().filter(manager=user.hitman.id)

        return queryset

    def hitManByboss(self, request):

        user = request.user

        queryset = super().get_queryset()

        return queryset


class Hitman(models.Model):

    name = fields.CharField(max_length=100, null=True)
    description = fields.CharField(max_length=500, null=True)
    status = fields.CharField(max_length=2, choices=STATUS_HITMAN, default='1')
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rol = models.CharField(max_length=2, choices=ROLES_HITS, default=1)
    manager = models.ForeignKey(
        'self', on_delete=models.CASCADE, null=True, blank=True)

    objects = HitManManager()

    def __str__(self) -> str:
        return self.name

    class Meta:
        db_table = 'hitman'
        verbose_name = 'Hitman'


class Hits(models.Model):

    target = fields.CharField(max_length=100, null=True)
    description = fields.CharField(max_length=500, null=True)
    status = fields.CharField(
        max_length=2, choices=STATUS_MISSION, default='1')
    date = fields.DateField()
    created_by = models.ForeignKey(User, related_name='hits_created_by', on_delete=models.DO_NOTHING,
                                   editable=False, null=True)

    hitman = models.ForeignKey(
        Hitman, on_delete=models.CASCADE,  null=True, blank=True, related_name='hits_hitman')
    objects = HitsManager()

    def __str__(self) -> str:
        return str(self.pk)

    def save(self, *args, **kwargs):

        req = get_request()

        if self.pk is None:

            self.created_by = req.user

        super(Hits, self).save(*args, **kwargs)

    class Meta:
        db_table = 'hits'
        verbose_name = 'Hit'
