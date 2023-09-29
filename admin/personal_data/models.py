from django.db import models
from admin.basemodel.models import BaseModel


class Gender(models.Model):
    name = models.CharField(max_length=255)

    class Meta:
        db_table = 'gender'


class Religion(models.Model):
    name = models.CharField(max_length=255)

    class Meta:
        db_table = 'religion'


class Matrimony(models.Model):
    name = models.CharField(max_length=110)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'matrimony'


class Blood_Group(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'blood_group'


class Division(BaseModel):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'division'


class District(BaseModel):
    name = models.CharField(max_length=255)
    division = models.ForeignKey('Division', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'district'


class Upazila(BaseModel):
    name = models.CharField(max_length=255)
    district = models.ForeignKey('District', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'upazila'


class Board(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'board'


class Day(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'days'
