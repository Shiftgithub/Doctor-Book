from django.db import models
from admin.medicine.models import Medicine
from admin.doctor.models import Doctor_Profile
from admin.patient.models import Patient_Profile


class Prescription(models.Model):
    patient_name = models.ForeignKey(Patient_Profile, on_delete=models.CASCADE, null=True)
    doctor_name = models.ForeignKey(Doctor_Profile, on_delete=models.CASCADE, null=True)

    cc = models.TextField(null=True, verbose_name='Chief Complain')
    oe = models.TextField(null=True, verbose_name='On Examination')
    dd = models.TextField(null=True, verbose_name='Differential Diagnosis')
    ad = models.TextField(null=True, verbose_name='Advice')
    tl = models.TextField(null=True, verbose_name='Treatment List')
    pmh = models.TextField(null=True, verbose_name='Past Medical History')

    issue_date = models.DateField(auto_now_add=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return f'Prescription for {self.patient_name}'

    class Meta:
        db_table = 'prescription'


class MedicineSchedule(models.Model):
    schedule = models.CharField(max_length=255)

    def __str__(self):
        return self.schedule

    class Meta:
        db_table = 'medicine_schedule'


class PrescriptionMedicine(models.Model):
    prescription = models.ForeignKey(Prescription, on_delete=models.CASCADE)
    medicine = models.ForeignKey(Medicine, on_delete=models.CASCADE, null=True)
    medicine_schedule = models.ForeignKey(MedicineSchedule, on_delete=models.CASCADE, null=True)

    frequency = models.CharField(max_length=255, null=True)
    duration = models.CharField(max_length=255, null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return f'PrescriptionMedicine ID: {self.id}'

    class Meta:
        db_table = 'prescription_medicine'


class LabTest(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'lab_test'


class PrescriptionLabTest(models.Model):
    prescription = models.ForeignKey(Prescription, on_delete=models.CASCADE)
    lab_test = models.ForeignKey(LabTest, on_delete=models.CASCADE, null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return f'PrescriptionLabTest ID: {self.id}'

    class Meta:
        db_table = 'prescription_lab_test'
