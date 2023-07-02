import os
from django.db.models.signals import pre_delete
from django.dispatch import receiver
from adminpanel.models.doctor_models import Images


@receiver(pre_delete, sender=Images)
def delete_previous_image(sender, instance, **kwargs):
    # Get the previous image path
    previous_image = instance.doctor_photos.path

    # Delete the previous image file
    if previous_image:
        try:
            os.remove(previous_image)
        except FileNotFoundError:
            pass
