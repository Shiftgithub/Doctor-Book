# Generated by Django 4.2.5 on 2023-09-22 15:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0011_rename_social_media_socialmedia'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='scheduletime',
            name='doctor_profile',
        ),
    ]
