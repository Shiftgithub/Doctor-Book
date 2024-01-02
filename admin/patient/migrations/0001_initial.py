<<<<<<< HEAD
# Generated by Django 5.0 on 2023-12-14 17:04
=======
# Generated by Django 5.0 on 2023-12-27 07:21
>>>>>>> 0a0d8f532772ef8919a2217788d4c6179800016c

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('personal_data', '0001_initial'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='PatientProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('full_name', models.CharField(max_length=255, null=True)),
                ('father_name', models.CharField(max_length=255, null=True)),
                ('mother_name', models.CharField(max_length=255, null=True)),
                ('phone_no', models.CharField(max_length=110, null=True)),
                ('registration_no', models.CharField(max_length=18, null=True, unique=True)),
                ('date_of_birth', models.DateField(null=True)),
                ('nid_no', models.IntegerField(null=True)),
                ('address', models.CharField(max_length=255, null=True)),
                ('blood_group', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.blood_group')),
                ('gender', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.gender')),
                ('matrimony', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.matrimony')),
                ('religion', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.religion')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='patients', to='user.user')),
            ],
            options={
                'db_table': 'patient_profile',
            },
        ),
    ]
