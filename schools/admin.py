# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from models import school, Boundary, Address, District

from django.contrib import admin

# Register your models here.

class DistrictAdmin(admin.ModelAdmin):
    list_display = ('name','dise_slug','type','school_type','status')

class BoundaryAdmin(admin.ModelAdmin):
    list_display = ('block','district')

class AddressAdmin(admin.ModelAdmin):
    list_display = ('boundary_id','address','area','pincode','landmark','location','instidentification')

admin.site.register(Address,AddressAdmin)
admin.site.register(school)
admin.site.register(District,DistrictAdmin)
admin.site.register(Boundary,BoundaryAdmin)