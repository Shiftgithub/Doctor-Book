import string
import secrets
from django.core.mail import send_mail
from django.conf import settings


def generate_token(length):
    return str(secrets.randbelow(10 ** 6)).zfill(length)


def generate_unique(length):
    # Generate 3 random alphabets
    alphabets = ''.join(secrets.choice(string.ascii_uppercase) for _ in range(3))

    # Generate a random number with the remaining length
    num_length = length - 3
    number = str(secrets.randbelow(10 ** num_length)).zfill(num_length)

    # Combine the alphabets and number
    unique = f"{alphabets}-{number}"

    return unique


def send_email(email, message):
    send_mail(
        'Doctor-Book From',
        message,
        settings.EMAIL_HOST_USER,
        [email],
        fail_silently=False
    )
