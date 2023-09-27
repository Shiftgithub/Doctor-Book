# Generated by Django 4.2.5 on 2023-09-22 12:12

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
                ('problem', models.CharField(max_length=255)),
                ('problem_specification', models.CharField(max_length=1000)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('organ', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='organ.organ')),
            ],
            options={
                'db_table': 'organ_problem_speci',
            },
        ),
    ]
