# Generated by Django 5.0 on 2023-12-14 17:04

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='VerifyOtp',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('otp', models.CharField(max_length=6)),
                ('is_verified', models.BooleanField(default=False)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='varify_otp', to='user.user')),
            ],
            options={
                'db_table': 'otp',
            },
        ),
    ]
