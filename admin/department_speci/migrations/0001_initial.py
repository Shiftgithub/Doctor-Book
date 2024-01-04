# Generated by Django 5.0 on 2024-01-03 12:17

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('department', '0001_initial'),
        ('organ_problem_speci', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='DepartmentSpecification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('description', models.CharField(max_length=1000)),
                ('department', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='departmentID', to='department.department')),
                ('organ_problem_specification', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='organ_problem_specificationID', to='organ_problem_speci.organsproblemspecification')),
            ],
            options={
                'db_table': 'department_speci',
            },
        ),
    ]
