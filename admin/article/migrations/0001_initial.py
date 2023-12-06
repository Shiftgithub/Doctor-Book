# Generated by Django 4.2.6 on 2023-12-06 15:46

import admin.article.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(null=True)),
                ('deleted_at', models.DateTimeField(null=True)),
                ('heading', models.CharField(max_length=1000)),
                ('tag', models.CharField(max_length=1000)),
                ('description', models.CharField(max_length=10000)),
                ('image', models.ImageField(null=True, upload_to=admin.article.models.article_filepath)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='created_article', to='user.user')),
                ('modified_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='modified_article', to='user.user')),
            ],
            options={
                'db_table': 'article',
            },
        ),
    ]
