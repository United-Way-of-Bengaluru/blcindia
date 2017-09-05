# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from models import school, Boundary, Address

from django.contrib import admin

# Register your models here.
admin.site.register(Boundary)
admin.site.register(Address)
admin.site.register(school)