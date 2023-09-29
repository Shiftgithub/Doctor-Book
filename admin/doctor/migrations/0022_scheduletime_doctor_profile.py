# Generated by Django 4.2.5 on 2023-09-23 10:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('doctor', '0021_appointmentschedule_created_by_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='scheduletime',
            name='doctor_profile',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='schedule_time', to='doctor.doctor_profile'),
        ),
    ]