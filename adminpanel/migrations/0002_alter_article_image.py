# Generated by Django 4.2.3 on 2023-07-10 12:05

import adminpanel.models.article_models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminpanel', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='image',
            field=models.ImageField(null=True, upload_to=adminpanel.models.article_models.article_filepath),
        ),
    ]
