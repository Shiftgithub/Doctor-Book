# Generated by Django 4.1.7 on 2023-06-30 06:37

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ('adminpanel', '0002_alter_services_doctor_profile'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='social_media',
            name='twitter',
        ),
    ]
