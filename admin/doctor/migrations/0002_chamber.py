# Generated by Django 5.0 on 2024-01-09 18:38

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Chamber',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('hospital_name', models.CharField(max_length=255, null=True)),
                ('address', models.CharField(max_length=255, null=True)),
                ('address_code', models.CharField(max_length=255, null=True)),
                ('phone_no', models.CharField(max_length=255, null=True)),
                ('open_closing', models.CharField(max_length=255, null=True)),
                ('doctor_profile', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='chamber', to='doctor.doctorprofile')),
            ],
            options={
                'db_table': 'chamber',
            },
        ),
    ]
