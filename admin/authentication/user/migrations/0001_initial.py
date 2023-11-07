# Generated by Django 4.2.6 on 2023-11-05 06:03

import admin.authentication.user.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('personal_data', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('user_name', models.CharField(max_length=255)),
                ('email', models.EmailField(max_length=255)),
                ('password', models.CharField(max_length=255, null=True)),
                ('hash', models.CharField(max_length=64, null=True)),
                ('role', models.CharField(max_length=20, null=True)),
                ('status', models.CharField(max_length=20, null=True)),
            ],
            options={
                'db_table': 'user',
            },
        ),
        migrations.CreateModel(
            name='PresentAddress',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('present_village_state', models.CharField(max_length=255)),
                ('present_postal_code', models.IntegerField()),
                ('present_district', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='present_district', to='personal_data.district')),
                ('present_division', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='present_division', to='personal_data.division')),
                ('present_upazila', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='present_upazila', to='personal_data.upazila')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='present_address', to='user.user')),
            ],
            options={
                'db_table': 'present_address',
            },
        ),
        migrations.CreateModel(
            name='PermanentAddress',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('permanent_village_state', models.CharField(max_length=255)),
                ('permanent_postal_code', models.IntegerField()),
                ('permanent_district', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='permanent_district', to='personal_data.district')),
                ('permanent_division', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='permanent_division', to='personal_data.division')),
                ('permanent_upazila', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='permanent_upazila', to='personal_data.upazila')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='permanent_address', to='user.user')),
            ],
            options={
                'db_table': 'permanent_address',
            },
        ),
        migrations.CreateModel(
            name='Images',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('photo_name', models.ImageField(null=True, upload_to=admin.authentication.user.models.image_filepath)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='images', to='user.user')),
            ],
            options={
                'db_table': 'images',
            },
        ),
        migrations.CreateModel(
            name='AdminProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('full_name', models.CharField(max_length=255, null=True)),
                ('father_name', models.CharField(max_length=255, null=True)),
                ('mother_name', models.CharField(max_length=255, null=True)),
                ('phone_no', models.CharField(max_length=110, null=True)),
                ('date_of_birth', models.DateField(null=True)),
                ('nid_no', models.IntegerField(null=True)),
                ('address', models.CharField(max_length=255, null=True)),
                ('blood_group', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admin', to='personal_data.blood_group')),
                ('gender', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admin', to='personal_data.gender')),
                ('matrimony', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admin', to='personal_data.matrimony')),
                ('religion', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='admin', to='personal_data.religion')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='admin', to='user.user')),
            ],
            options={
                'db_table': 'admin_profile',
            },
        ),
    ]
