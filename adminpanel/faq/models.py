from django.db import models
from adminpanel.user.models import User


class FAQ(models.Model):
    question = models.CharField(max_length=255)
    answer = models.CharField(max_length=1000)
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, related_name="created", blank=True,
                                   null=True)
    modified_by = models.ForeignKey(User, on_delete=models.SET_NULL, related_name="modified", blank=True,
                                    null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.question
