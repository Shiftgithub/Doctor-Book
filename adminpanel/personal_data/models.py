from django.db import models


class Gender(models.Model):
    name = models.CharField(max_length=255)


class Religion(models.Model):
    name = models.CharField(max_length=255)


class Matrimony(models.Model):
    name = models.CharField(max_length=110)

    def __str__(self):
        return self.name


class Blood_Group(models.Model):
    name = models.CharField(max_length=255)


class Division(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class District(models.Model):
    name = models.CharField(max_length=255)
    division = models.ForeignKey('Division', on_delete=models.CASCADE)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Upazila(models.Model):
    name = models.CharField(max_length=255)
    district = models.ForeignKey('District', on_delete=models.CASCADE)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Board(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name