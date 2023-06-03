from django.db import models


class BodyPart(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Organ(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    body_part = models.ForeignKey(
        BodyPart, on_delete=models.SET_NULL, related_name="organs", blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class OrgansProbleam(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    organ = models.ForeignKey(
        Organ, on_delete=models.SET_NULL, related_name="organProbleams", blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class ProblemSpecification(models.Model):
    specification = models.CharField(max_length=1000)
    description = models.CharField(max_length=1000)
    organ = models.ForeignKey(
        Organ, on_delete=models.SET_NULL, related_name="organ", blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class Department(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name


class DepartmentSpecification(models.Model):
    description = models.CharField(max_length=1000)
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL, related_name="departmentId", blank=True, null=True)
    problem_specification = models.ForeignKey(
        ProblemSpecification, on_delete=models.SET_NULL, related_name="problem_specification", blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.description


class Doctor(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL, related_name="department", blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.name
