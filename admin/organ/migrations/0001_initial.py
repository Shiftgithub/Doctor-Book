# Generated by Django 5.0 on 2024-01-19 21:04

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('bodypart', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Organ',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('name', models.CharField(max_length=255)),
                ('description', models.CharField(max_length=1000)),
                ('body_part', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='bodypart.bodypart')),
            ],
            options={
                'db_table': 'organ',
            },
        ),
    ]
