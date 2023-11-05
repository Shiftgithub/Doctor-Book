# Generated by Django 4.2.6 on 2023-11-05 06:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('organ', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrgansProblemSpecification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('problem', models.CharField(max_length=255)),
                ('problem_specification', models.CharField(max_length=1000)),
                ('organ', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='organ.organ')),
            ],
            options={
                'db_table': 'organ_problem_speci',
            },
        ),
    ]
