# Generated by Django 4.2.6 on 2023-12-03 12:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('prescription', '0012_alter_medicineprescription_prescription'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='medicineprescription',
            table='medicine_prescriptions',
        ),
    ]