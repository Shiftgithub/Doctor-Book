# Generated by Django 4.2.5 on 2023-09-22 19:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0017_remove_appointmentschedule_created_by_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='awards',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='awards',
            name='modified_by',
        ),
        migrations.RemoveField(
            model_name='offday',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='offday',
            name='modified_by',
        ),
    ]
