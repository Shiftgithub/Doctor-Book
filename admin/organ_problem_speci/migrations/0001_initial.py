# Generated by Django 5.0 on 2024-01-19 21:04

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('organ', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrgansProblemSpecification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('problem', models.CharField(max_length=255)),
                ('problem_specification', models.CharField(max_length=1000)),
                ('organ', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='organ.organ')),
            ],
            options={
                'db_table': 'organ_problem_speci',
            },
        ),
    ]
