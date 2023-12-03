# Generated by Django 4.2.6 on 2023-12-02 12:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_alter_user_password'),
        ('patient', '0001_initial'),
        ('doctor', '0002_alter_offday_table'),
        ('medicine', '0001_initial'),
        ('prescription', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='LabTestPrescription',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='LabTestPrescriptionCreated', to='user.user')),
            ],
            options={
                'db_table': 'lab_test_prescription',
            },
        ),
        migrations.CreateModel(
            name='MedicinePrescription',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('frequency', models.CharField(max_length=255, null=True)),
                ('duration', models.CharField(max_length=255, null=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='MedicinePrescriptionCreated', to='user.user')),
                ('medicine', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prescription_medicine', to='medicine.medicine')),
                ('medicine_schedule', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='prescription.medicineschedule')),
                ('modified_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='MedicinePrescriptionModified', to='user.user')),
            ],
            options={
                'db_table': 'medicine_prescription',
            },
        ),
        migrations.CreateModel(
            name='PrescriptionForLabTest',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('cc', models.TextField(null=True, verbose_name='Chief Complain')),
                ('oe', models.TextField(null=True, verbose_name='On Examination')),
                ('dd', models.TextField(null=True, verbose_name='Differential Diagnosis')),
                ('ad', models.TextField(null=True, verbose_name='Advice')),
                ('tl', models.TextField(null=True, verbose_name='Treatment List')),
                ('pmh', models.TextField(null=True, verbose_name='Past Medical History')),
                ('issue_date', models.DateField(auto_now_add=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='PrescriptionForLabTestCreated', to='user.user')),
                ('doctor_profile', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='doctor_name', to='doctor.doctorprofile')),
                ('modified_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='PrescriptionForLabTestModified', to='user.user')),
                ('patient_profile', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patient_name', to='patient.patientprofile')),
            ],
            options={
                'db_table': 'prescription_for_lab_test',
            },
        ),
        migrations.CreateModel(
            name='PrescriptionForMedicine',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('cc', models.TextField(null=True, verbose_name='Chief Complain')),
                ('oe', models.TextField(null=True, verbose_name='On Examination')),
                ('dd', models.TextField(null=True, verbose_name='Differential Diagnosis')),
                ('ad', models.TextField(null=True, verbose_name='Advice')),
                ('tl', models.TextField(null=True, verbose_name='Treatment List')),
                ('pmh', models.TextField(null=True, verbose_name='Past Medical History')),
                ('issue_date', models.DateField(auto_now_add=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='PrescriptionForMedicineCreated', to='user.user')),
                ('doctor_profile', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='doctor', to='doctor.doctorprofile')),
                ('modified_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='PrescriptionForMedicineModified', to='user.user')),
                ('patient_profile', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patient', to='patient.patientprofile')),
            ],
            options={
                'db_table': 'prescription_for_medicine',
            },
        ),
        migrations.RemoveField(
            model_name='prescriptionlabtest',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='prescriptionlabtest',
            name='lab_test',
        ),
        migrations.RemoveField(
            model_name='prescriptionlabtest',
            name='modified_by',
        ),
        migrations.RemoveField(
            model_name='prescriptionlabtest',
            name='prescription',
        ),
        migrations.RemoveField(
            model_name='prescriptionmedicine',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='prescriptionmedicine',
            name='medicine',
        ),
        migrations.RemoveField(
            model_name='prescriptionmedicine',
            name='medicine_schedule',
        ),
        migrations.RemoveField(
            model_name='prescriptionmedicine',
            name='modified_by',
        ),
        migrations.RemoveField(
            model_name='prescriptionmedicine',
            name='prescription',
        ),
        migrations.DeleteModel(
            name='Prescription',
        ),
        migrations.DeleteModel(
            name='PrescriptionLabTest',
        ),
        migrations.DeleteModel(
            name='PrescriptionMedicine',
        ),
        migrations.AddField(
            model_name='medicineprescription',
            name='prescription',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prescription_medicine', to='prescription.prescriptionformedicine'),
        ),
        migrations.AddField(
            model_name='labtestprescription',
            name='lab_prescription',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prescription_lab', to='prescription.prescriptionforlabtest'),
        ),
        migrations.AddField(
            model_name='labtestprescription',
            name='lab_test',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='prescription_medicine', to='prescription.labtest'),
        ),
        migrations.AddField(
            model_name='labtestprescription',
            name='modified_by',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='LabTestPrescriptionModified', to='user.user'),
        ),
    ]
