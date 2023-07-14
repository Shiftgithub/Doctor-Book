# Generated by Django 4.2.3 on 2023-07-12 05:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('adminpanel', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Patient_Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=255, null=True)),
                ('father_name', models.CharField(max_length=255, null=True)),
                ('mother_name', models.CharField(max_length=255, null=True)),
                ('phone_no', models.CharField(max_length=110, null=True)),
                ('date_of_birth', models.DateField(null=True)),
                ('nid_no', models.CharField(max_length=20, null=True)),
                ('address', models.CharField(max_length=255, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('blood_group', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='adminpanel.blood_group')),
                ('gender', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='adminpanel.gender')),
                ('matrimony', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='adminpanel.matrimony')),
                ('religion', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patients', to='adminpanel.religion')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='patients', to='adminpanel.user')),
            ],
        ),
    ]
