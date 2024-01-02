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
    try:
        # Attempt to send the email
        send_mail(
            'Doctor-Book From',
            message,
            settings.EMAIL_HOST_USER,
            [email],
            fail_silently=False
        )
        # If send_mail doesn't raise an exception, it means the email was sent successfully
        return True
    except Exception as e:
        # If an exception is raised, it means there was an error in sending the email
        # You can log the exception or handle it based on your requirements
        print(f"Error sending email: {e}")
        return False
