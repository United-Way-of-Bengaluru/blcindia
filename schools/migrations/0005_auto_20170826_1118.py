# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-26 11:18
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('schools', '0004_auto_20170826_1117'),
    ]

    operations = [
        migrations.RenameField(
            model_name='school',
            old_name='blockName',
            new_name='block_name',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='buildingStatus',
            new_name='building_status',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='cdpoName',
            new_name='cdpo_name',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='cdpoNumber',
            new_name='cdpo_number',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='helperName',
            new_name='helper_name',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='helperNumber',
            new_name='helper_number',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='ruralUrban',
            new_name='rural_urban',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='schoolCode',
            new_name='school_code',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='schoolName',
            new_name='school_name',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='supervisorName',
            new_name='supervisor_name',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='supervisorNumber',
            new_name='supervisor_number',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='workerName',
            new_name='worker_name',
        ),
        migrations.RenameField(
            model_name='school',
            old_name='workerNumber',
            new_name='worker_number',
        ),
    ]
