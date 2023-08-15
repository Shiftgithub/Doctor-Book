from django.db import models


class User(models.Model):
    user_name = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    password = models.CharField(max_length=255)

    hash = models.CharField(max_length=64, null=True)  # Assuming SHA-256 hash is 64 characters long
    role = models.CharField(max_length=20, null=True)  # Choices: admin, doctor, patient
    status = models.CharField(max_length=20, null=True)  # Choices: active, inactive, pending

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.user_name
