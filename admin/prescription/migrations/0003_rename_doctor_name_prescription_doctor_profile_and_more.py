# Generated by Django 4.2.6 on 2023-11-06 09:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('prescription', '0002_alter_prescription_doctor_name_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='prescription',
            old_name='doctor_name',
            new_name='doctor_profile',
        ),
        migrations.RenameField(
            model_name='prescription',
            old_name='patient_name',
            new_name='patient_profile',
        ),
    ]
