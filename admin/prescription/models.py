from django.db import models
from admin.medicine.models import Medicine
from admin.basemodel.models import BaseModel
from admin.doctor.models import DoctorProfile
from admin.patient.models import PatientProfile
from admin.authentication.user.models import User


class MedicineSchedule(models.Model):
    schedule = models.CharField(max_length=255)

    def __str__(self):
        return self.schedule

    class Meta:
        db_table = 'medicine_schedule'


class PrescriptionForMedicine(BaseModel):
    patient_profile = models.ForeignKey(PatientProfile, related_name='patient', on_delete=models.CASCADE, null=True)
    doctor_profile = models.ForeignKey(DoctorProfile, related_name='doctor', on_delete=models.CASCADE, null=True)

    cc = models.TextField(null=True, verbose_name='Chief Complain')
    oe = models.TextField(null=True, verbose_name='On Examination')
    dd = models.TextField(null=True, verbose_name='Differential Diagnosis')
    ad = models.TextField(null=True, verbose_name='Advice')
    tl = models.TextField(null=True, verbose_name='Treatment List')
    pmh = models.TextField(null=True, verbose_name='Past Medical History')

    issue_date = models.DateField(auto_now_add=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='PrescriptionForMedicineCreated',
                                   null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='PrescriptionForMedicineModified',
                                    null=True)

    class Meta:
        db_table = 'prescription_for_medicine'


class MedicinePrescription(BaseModel):
    prescription = models.ForeignKey(PrescriptionForMedicine, related_name='medicine_prescription',
                                     on_delete=models.CASCADE, null=True)
    medicine = models.ForeignKey(Medicine, related_name='medicine', on_delete=models.CASCADE, null=True)
    medicine_schedule = models.ForeignKey(MedicineSchedule, on_delete=models.CASCADE, null=True)

    frequency = models.CharField(max_length=255, null=True)
    duration = models.CharField(max_length=255, null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='MedicinePrescriptionCreated',
                                   null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='MedicinePrescriptionModified',
                                    null=True)

    class Meta:
        db_table = 'medicine_prescription'


class LabTest(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'lab_test'


class PrescriptionForLabTest(BaseModel):
    patient_profile = models.ForeignKey(PatientProfile, related_name='patient_name', on_delete=models.CASCADE,
                                        null=True)
    doctor_profile = models.ForeignKey(DoctorProfile, related_name='doctor_name', on_delete=models.CASCADE, null=True)

    cc = models.TextField(null=True, verbose_name='Chief Complain')
    oe = models.TextField(null=True, verbose_name='On Examination')
    dd = models.TextField(null=True, verbose_name='Differential Diagnosis')
    ad = models.TextField(null=True, verbose_name='Advice')
    tl = models.TextField(null=True, verbose_name='Treatment List')
    pmh = models.TextField(null=True, verbose_name='Past Medical History')

    issue_date = models.DateField(auto_now_add=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='PrescriptionForLabTestCreated',
                                   null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='PrescriptionForLabTestModified',
                                    null=True)

    class Meta:
        db_table = 'prescription_for_lab_test'


class LabTestPrescription(BaseModel):
    lab_prescription = models.ForeignKey(PrescriptionForLabTest, related_name='prescription_lab',
                                         on_delete=models.CASCADE, null=True)
    lab_test = models.ForeignKey(LabTest, related_name='prescription_medicine', on_delete=models.CASCADE, null=True)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='LabTestPrescriptionCreated',
                                   null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='LabTestPrescriptionModified',
                                    null=True)

    class Meta:
        db_table = 'lab_test_prescription'
