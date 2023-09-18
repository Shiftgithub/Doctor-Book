from django.db import models


class Brand(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "medicine_brand"


class Generic(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "medicine_generic"


class Strength(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "medicine_strength"


class MedicineType(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "medicine_type"


class Medicine(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255, null=True)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE, related_name="medicine")
    generic = models.ForeignKey(Generic, on_delete=models.CASCADE, related_name="medicine")
    medicine_type = models.ForeignKey(MedicineType, on_delete=models.CASCADE, related_name="medicine")
    strength = models.ForeignKey(Strength, on_delete=models.CASCADE, related_name="medicine")

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "medicine"
