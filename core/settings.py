"""
Django settings for core project.

Generated by 'django-admin startproject' using Django 4.2.6.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.2/ref/settings/
"""

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-$u@85i@94q!ptjtmlq_b=auap*tt(77@4fj_y&t*vm&brh5p-&'

# SECURITY WARNING: don't run with debug turned on in production!
from core.constants import *

EMAIL_USE_TLS = EMAIL_USE_TLS
EMAIL_HOST = EMAIL_HOST
EMAIL_HOST_USER = EMAIL_HOST_USER
EMAIL_HOST_PASSWORD = EMAIL_HOST_PASSWORD
EMAIL_PORT = EMAIL_PORT
EMAIL_BACKEND = EMAIL_BACKEND

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['127.0.0.1', '10.0.2.2']

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # api
    'api.apps.ApiConfig',

    # admin/
    'admin.ajax.apps.AjaxConfig',
    'admin.article.apps.ArticleConfig',
    'admin.bodypart.apps.BodypartConfig',
    'admin.dashboard.apps.DashboardConfig',
    'admin.department.apps.DepartmentConfig',
    'admin.department_speci.apps.DepartmentSpeciConfig',
    'admin.doctor.apps.DoctorConfig',
    'admin.faq.apps.FaqConfig',
    'admin.medicine.apps.MedicineConfig',
    'admin.organ.apps.OrganConfig',
    'admin.organ_problem_speci.apps.OrganProblemSpeciConfig',
    'admin.patient.apps.PatientConfig',
    'admin.personal_data.apps.PersonalDataConfig',
    'admin.prescription.apps.PrescriptionConfig',
    'admin.urls.apps.UrlsConfig',

    # admin/authentication
    'admin.authentication.login',
    'admin.authentication.logout',
    'admin.authentication.user.apps.UserConfig',

    # admin/authentication/otp
    'admin.authentication.otp.resendotp',
    'admin.authentication.otp.resetpassword',
    'admin.authentication.otp.verifyotp',

    # landing
    'landing.appointment.apps.AppointmentConfig',
    'landing.landing.apps.LandingConfig',
    'landing.prediction.apps.PredictionConfig',
    'landing.url.apps.UrlConfig',

    # rest_framework
    'rest_framework',
    'debug_toolbar',
    'barcode',

    # 'corsheaders',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',

    'django.middleware.csrf.CsrfViewMiddleware',
    # 'corsheaders.middleware.CorsMiddleware',

    'debug_toolbar.middleware.DebugToolbarMiddleware',
]

ROOT_URLCONF = 'core.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            BASE_DIR / 'admin/',
            BASE_DIR / 'landing/',
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'core.wsgi.application'

# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'doctor_book',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    },
}

# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = 'static/'
STATICFILES_DIRS = [
    BASE_DIR / 'static',
]

# Default primary key field type
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

SESSION_EXPIRE_AT_BROWSER_CLOSE = True

INTERNAL_IPS = [
    '127.0.0.1',
]

# CORS_ALLOW_ALL_ORIGINS = True

# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field
