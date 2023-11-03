from django.db import models
from admin.basemodel.models import BaseModel
from admin.authentication.user.models import User


class FAQ(BaseModel):
    question = models.CharField(max_length=255)
    answer = models.CharField(max_length=1000)

    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_faq', null=True)
    modified_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='modified_faq', null=True)

    def __str__(self):
        return self.question

    class Meta:
        db_table = 'faq'
