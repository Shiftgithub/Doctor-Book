# Generated by Django 4.2.5 on 2023-09-19 14:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('prescription', '0004_remove_prescription_ad_remove_prescription_cc_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='labtest',
            name='created_at',
        ),
        migrations.RemoveField(
            model_name='labtest',
            name='deleted_at',
        ),
        migrations.RemoveField(
            model_name='labtest',
            name='remarks',
        ),
        migrations.RemoveField(
            model_name='labtest',
            name='updated_at',
        ),
        migrations.AddField(
            model_name='prescription',
            name='ad',
            field=models.TextField(null=True, verbose_name='Advice'),
        ),
        migrations.AddField(
            model_name='prescription',
            name='cc',
            field=models.TextField(null=True, verbose_name='Chief Complain'),
        ),
        migrations.AddField(
            model_name='prescription',
            name='dd',
            field=models.TextField(null=True, verbose_name='Differential Diagnosis'),
        ),
        migrations.AddField(
            model_name='prescription',
            name='oe',
            field=models.TextField(null=True, verbose_name='On Examination'),
        ),
        migrations.AddField(
            model_name='prescription',
            name='pmh',
            field=models.TextField(null=True, verbose_name='Past Medical History'),
        ),
        migrations.AddField(
            model_name='prescription',
            name='tl',
            field=models.TextField(null=True, verbose_name='Treatment List'),
        ),
    ]
