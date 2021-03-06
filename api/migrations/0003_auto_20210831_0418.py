# Generated by Django 3.2.6 on 2021-08-31 09:18

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('api', '0002_auto_20210831_0057'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hitman',
            name='rol',
            field=models.CharField(choices=[('1', 'HITMAN'), ('2', 'MANAGER')], default=1, max_length=2),
        ),
        migrations.AlterField(
            model_name='hits',
            name='created_by',
            field=models.ForeignKey(editable=False, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='hits_created_by', to=settings.AUTH_USER_MODEL),
        ),
    ]
