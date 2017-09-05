# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-26 11:17
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('schools', '0003_auto_20170826_1114'),
    ]

    operations = [
        migrations.RenameField(
            model_name='school',
            old_name='block_name',
            new_name='blockName',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='building_status',
            new_name='buildingStatus',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='cdpo_name',
            new_name='cdpoName',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='cdpo_number',
            new_name='cdpoNumber',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='helper_name',
            new_name='helperName',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='helper_number',
            new_name='helperNumber',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='rural_urban',
            new_name='ruralUrban',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='school_code',
            new_name='schoolCode',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='school_name',
            new_name='schoolName',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='supervisor_name',
            new_name='supervisorName',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='supervisor_number',
            new_name='supervisorNumber',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='worker_name',
            new_name='workerName',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='worker_number',
            new_name='workerNumber',
        ),
        migrations.RemoveField(
            model_name='school',
            name='new_pincode',
        ),
    ]
