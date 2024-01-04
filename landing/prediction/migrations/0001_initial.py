# Generated by Django 5.0 on 2024-01-03 12:17

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('bodypart', '0001_initial'),
        ('department', '0001_initial'),
        ('department_speci', '0001_initial'),
        ('organ', '0001_initial'),
        ('organ_problem_speci', '0001_initial'),
        ('patient', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Prediction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('body_part', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prediction', to='bodypart.bodypart')),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prediction', to='patient.patientprofile')),
                ('department', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prediction', to='department.department')),
                ('department_speci', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prediction', to='department_speci.departmentspecification')),
                ('organ', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prediction', to='organ.organ')),
            ],
            options={
                'db_table': 'prediction',
            },
        ),
        migrations.CreateModel(
            name='Specification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('accuracy', models.DecimalField(decimal_places=3, max_digits=10, null=True)),
                ('prediction', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='specification', to='prediction.prediction')),
                ('problem_specification', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='specification', to='organ_problem_speci.organsproblemspecification')),
            ],
            options={
                'db_table': 'specification',
            },
        ),
    ]
