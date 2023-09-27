# Generated by Django 4.2.5 on 2023-09-22 12:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('personal_data', '0001_initial'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Patient_Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=255, null=True)),
                ('father_name', models.CharField(max_length=255, null=True)),
                ('mother_name', models.CharField(max_length=255, null=True)),
                ('phone_no', models.CharField(max_length=110, null=True)),
                ('unique_id', models.CharField(max_length=255, null=True, unique=True)),
                ('date_of_birth', models.DateField(null=True)),
                ('nid_no', models.IntegerField(null=True)),
                ('address', models.CharField(max_length=255, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('blood_group', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.blood_group')),
                ('gender', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.gender')),
                ('matrimony', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.matrimony')),
                ('religion', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='personal_data.religion')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='patients', to='user.user')),
            ],
            options={
                'db_table': 'patient',
            },
        ),
        migrations.CreateModel(
            name='Appointment_fixed',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('appointment_date', models.DateField()),
                ('appointment_time', models.TimeField()),
                ('reason_for_visit', models.TextField(null=True)),
                ('is_confirmed', models.BooleanField(default=False)),
                ('doctor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doctor_appointments', to='user.user')),
                ('patient', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='appointments', to='patient.patient_profile')),
            ],
        ),
    ]
