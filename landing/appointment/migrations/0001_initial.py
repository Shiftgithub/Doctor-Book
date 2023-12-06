# Generated by Django 4.2.6 on 2023-12-06 15:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('doctor', '0001_initial'),
        ('patient', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GetAppointment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('appointment_date', models.TextField(max_length=255, null=True)),
                ('appointment_time', models.TextField(max_length=255, null=True)),
                ('is_confirmed', models.BooleanField(default=False, null=True)),
                ('doctor', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients_appointments', to='doctor.doctorprofile')),
                ('patient', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients_appointments', to='patient.patientprofile')),
            ],
            options={
                'db_table': 'patient_appointment',
            },
        ),
    ]
