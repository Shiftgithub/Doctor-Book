# Generated by Django 4.2.5 on 2023-09-29 16:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('personal_data', '0001_initial'),
        ('user', '0001_initial'),
        ('department', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AppointmentSchedule',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('per_patient_time', models.IntegerField(null=True)),
                ('consultation_fee', models.IntegerField(null=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='created_appointment', to='user.user')),
            ],
            options={
                'db_table': 'doctor_appointment_schedule',
            },
        ),
        migrations.CreateModel(
            name='Doctor_Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('full_name', models.CharField(max_length=255)),
                ('father_name', models.CharField(max_length=255)),
                ('mother_name', models.CharField(max_length=255)),
                ('date_of_birth', models.DateField()),
                ('birth_registration_no', models.CharField(max_length=255, null=True)),
                ('phone_no', models.CharField(max_length=110, null=True)),
                ('nid_no', models.CharField(max_length=20, null=True)),
                ('experience', models.CharField(max_length=1000, null=True)),
                ('biography', models.CharField(max_length=1000, null=True)),
                ('languages_spoken', models.CharField(max_length=255, null=True)),
                ('passport_no', models.CharField(max_length=255, null=True)),
                ('blood_group', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doctors', to='personal_data.blood_group')),
                ('department', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doctors', to='department.department')),
                ('gender', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doctors', to='personal_data.gender')),
                ('matrimony', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doctors', to='personal_data.matrimony')),
                ('religion', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doctors', to='personal_data.religion')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='doctors', to='user.user')),
            ],
            options={
                'db_table': 'doctor_profile',
            },
        ),
        migrations.CreateModel(
            name='SocialMedia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('website', models.URLField(null=True)),
                ('facebook', models.URLField(null=True)),
                ('instagram', models.URLField(null=True)),
                ('linkedin', models.URLField(null=True)),
                ('doctor_profile', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='social_media', to='doctor.doctor_profile')),
            ],
            options={
                'db_table': 'doctor_social_media',
            },
        ),
        migrations.CreateModel(
            name='ScheduleTime',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('start_time', models.TimeField(null=True)),
                ('end_time', models.TimeField(null=True)),
                ('appointment_schedule', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='schedule_time', to='doctor.appointmentschedule')),
            ],
            options={
                'db_table': 'doctor_schedule_times',
            },
        ),
        migrations.CreateModel(
            name='OffDay',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='created_off_day', to='user.user')),
                ('doctor_profile', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='off_days', to='doctor.doctor_profile')),
                ('modified_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='modified_off_day', to='user.user')),
                ('off_day', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='off_day_name', to='personal_data.day')),
            ],
            options={
                'db_table': 'off_day',
            },
        ),
        migrations.CreateModel(
            name='Education',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('certificate_degree', models.CharField(max_length=255)),
                ('institution', models.CharField(max_length=255)),
                ('result', models.DecimalField(decimal_places=2, max_digits=10, null=True)),
                ('passing_year', models.DateField()),
                ('board', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='educationID', to='personal_data.board')),
                ('doctor_profile', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='education', to='doctor.doctor_profile')),
            ],
            options={
                'db_table': 'doctor_educations',
            },
        ),
        migrations.CreateModel(
            name='Awards',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('awards', models.CharField(max_length=255, null=True)),
                ('honors', models.CharField(max_length=255, null=True)),
                ('publications', models.CharField(max_length=255, null=True)),
                ('research_interests', models.CharField(max_length=255, null=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='created_awards', to='user.user')),
                ('doctor_profile', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='awards', to='doctor.doctor_profile')),
                ('modified_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='modified_awards', to='user.user')),
            ],
            options={
                'db_table': 'doctor_awards',
            },
        ),
        migrations.AddField(
            model_name='appointmentschedule',
            name='doctor_profile',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='appointment_schedules', to='doctor.doctor_profile'),
        ),
        migrations.AddField(
            model_name='appointmentschedule',
            name='modified_by',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='modified_appointment', to='user.user'),
        ),
    ]
