# Generated by Django 4.2.5 on 2023-09-22 19:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0016_appointmentschedule_created_by_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='appointmentschedule',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='appointmentschedule',
            name='modified_by',
        ),
    ]
