from django.db import models
from admin.basemodel.models import BaseModel
from admin.authentication.user.models import User


class Brand(BaseModel):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'medicine_brand'


class Generic(BaseModel):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'medicine_generic'


class Strength(BaseModel):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'medicine_strength'


class MedicineType(BaseModel):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'medicine_type'


class Medicine(BaseModel):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255, null=True)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE, related_name='medicine')
    generic = models.ForeignKey(Generic, on_delete=models.CASCADE, related_name='medicine')
    medicine_type = models.ForeignKey(MedicineType, on_delete=models.CASCADE, related_name='medicine')
    strength = models.ForeignKey(Strength, on_delete=models.CASCADE, related_name='medicine')

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_medicines', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_medicines', null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'medicine'
