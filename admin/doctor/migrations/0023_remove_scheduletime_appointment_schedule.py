# Generated by Django 4.2.5 on 2023-09-23 10:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0022_scheduletime_doctor_profile'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='scheduletime',
            name='appointment_schedule',
        ),
    ]