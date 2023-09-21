import secrets
from django.core.mail import send_mail
from django.conf import settings


def generate_token(length):
    return str(secrets.randbelow(10 ** 6)).zfill(length)
def generate_unique(length):
    return str(secrets.randbelow(10 ** 11)).zfill(length)

def send_email(email, message):
    send_mail(
        'Doctor-Book From',
        message,
        settings.EMAIL_HOST_USER,
        [email],
        fail_silently=False
    )
