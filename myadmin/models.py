import os
import datetime
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


class OrgansProblem(models.Model):
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

class FAQ(models.Model):
    question = models.CharField(max_length=255)
    answer = models.CharField(max_length=1000)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.question

def article_filepath(request, filename):
    # Get the original filename
    old_filename = filename

    # Get the current timestamp
    time_now = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')

    # Generate a new filename using the timestamp and original filename
    filename = "%s_%s" % (time_now, old_filename)

    # Return the relative path to the folder where you want to save the image
    return os.path.join('static', 'uploads', 'article_images', filename)

class Article(models.Model):
    heading = models.CharField(max_length=255)
    tag = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    image = models.ImageField(upload_to=article_filepath)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.heading


    


