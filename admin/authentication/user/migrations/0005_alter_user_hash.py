# Generated by Django 5.0 on 2023-12-28 18:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_alter_user_options_alter_user_table'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='hash',
            field=models.CharField(max_length=255, null=True),
        ),
    ]
