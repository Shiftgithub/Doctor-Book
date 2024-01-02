import os
import datetime
from django.db import models
from admin.basemodel.models import BaseModel


def department_filepath(instance, filename):
    # Get the original filename
    old_filename = filename

    # Get the current timestamp
    time_now = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')

    # Generate a new filename using the timestamp and original filename
    filename = "%s_%s" % (time_now, old_filename)

    # Return the relative path to the folder where you want to save the image
    return os.path.join('static', 'uploads', 'department_images', filename)


class Department(BaseModel):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=1000)
    image = models.ImageField(upload_to=department_filepath, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'department'
