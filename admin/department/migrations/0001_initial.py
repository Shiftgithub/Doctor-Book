# Generated by Django 4.2.6 on 2023-12-07 12:12

import admin.department.models
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('name', models.CharField(max_length=255)),
                ('description', models.CharField(max_length=1000)),
                ('image', models.ImageField(null=True, upload_to=admin.department.models.department_filepath)),
            ],
            options={
                'db_table': 'department',
            },
        ),
    ]
