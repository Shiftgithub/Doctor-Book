# Generated by Django 4.2.6 on 2023-12-02 12:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('prescription', '0002_labtestprescription_medicineprescription_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='labtestprescription',
            name='lab_test',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='labtest_name', to='prescription.labtest'),
        ),
    ]