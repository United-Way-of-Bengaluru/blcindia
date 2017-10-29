# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

# communicationChoices = (('1','Phone'),('2','Mail'))
# leadChoices = (('1','Hot'),('2','Warm'),('3','Closed Win'),('4','Closed Lost'),('5','Junk'))
# actionChoices = (('1','Follow upon call'),('2','Meeting'),('3','Email to be sent'))
# class AppointmentFollowup(models.Model):
#     comment = models.TextField()
#     communication_mode = models.CharField(choices=communicationChoices, max_length=10)
#     lead_status = models.CharField(choices=leadChoices, max_length=10)
#     next_action = models.CharField(choices=actionChoices, max_length=10)
#     created_on = models.DateTimeField(auto_now_add=True)
#     updated_on = models.DateTimeField(auto_now=True)
#     class Meta:
#         verbose_name = 'Appointment Followup'
#         verbose_name_plural = 'Appointment Followup'
