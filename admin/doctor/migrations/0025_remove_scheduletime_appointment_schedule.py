# Generated by Django 4.2.5 on 2023-09-23 10:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0024_scheduletime_appointment_schedule'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='scheduletime',
            name='appointment_schedule',
        ),
    ]