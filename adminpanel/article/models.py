import os
import datetime
from django.db import models
from adminpanel.user.models import User


def article_filepath(instance, filename):
    # Get the original filename
    old_filename = filename

    # Get the current timestamp
    time_now = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')

    # Generate a new filename using the timestamp and original filename
    filename = "%s_%s" % (time_now, old_filename)

    # Return the relative path to the folder where you want to save the image
    return os.path.join('static', 'uploads', 'article_images', filename)


class Article(models.Model):
    heading = models.CharField(max_length=1000)
    tag = models.CharField(max_length=1000)
    description = models.CharField(max_length=10000)
    image = models.ImageField(upload_to=article_filepath, null=True)
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, related_name="created_by", blank=True,
                                   null=True)
    modified_by = models.ForeignKey(User, on_delete=models.SET_NULL, related_name="modified_by", blank=True,
                                    null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=False, null=True)
    deleted_at = models.DateTimeField(auto_now_add=False, null=True)

    def __str__(self):
        return self.heading
