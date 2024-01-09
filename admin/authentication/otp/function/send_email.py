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


def send_email(email, full_name, message):
    try:
        # Build the HTML content with the image, message, and additional data
        html_content = f'''
        <html>
        <head>
            <style>
                .content p {{
                    margin-bottom: 10px; /* You can adjust this value based on your preference */
                }}
            </style>
        </head>
        <body>
            <div class="content">
               <h3> Dear {full_name},</h3>
               <h4>Thank you for Using Doctor Book. </h4>
               <h2>{message}</h2>
               <p>Regards,</p>
               <p>Doctor Book,</p>
               <p>+8801965572363</p>
               <p>Website: https://www.doctor-book.com</p>
               <p>Facebook: https://www.facebook.com/doctor-book</p>
               <p>LinkedIn: https://www.linkedin.com/company/doctor-book/</p>
            </div>
        </body>
        </html>
        '''

        # Attempt to send the email
        send_mail(
            'Doctor Book : Personalized Doctor Predictor',
            '',  # Leave the message parameter empty since the content is in the HTML
            settings.EMAIL_HOST_USER,
            [email],
            html_message=html_content,
            fail_silently=False
        )

        # If send_mail doesn't raise an exception, it means the email was sent successfully
        return True
    except Exception as e:
        # If an exception is raised, it means there was an error in sending the email
        # You can log the exception or handle it based on your requirements
        print(f"Error sending email: {e}")
        return False
