# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from models import school, Boundary, Address, District, type
from mapwidgets.widgets import GooglePointFieldWidget
from django.contrib import admin
from django.contrib.gis.db import models

# Register your models here.

class DistrictAdmin(admin.ModelAdmin):
    list_display = ('name','dise_slug','type','school_type','status')

class BoundaryAdmin(admin.ModelAdmin):
    list_display = ('block','district')

class AddressAdmin(admin.ModelAdmin):
    list_display = ('boundary_id','address','area','pincode','landmark','location','instidentification')
    formfield_overrides = {
        models.PointField: {"widget": GooglePointFieldWidget}
    }

class  SchoolAdmin(admin.ModelAdmin):
	"""docstring for  """
	fieldsets = (
        ('School Info', {
            'fields': ('name', 'address', 'type', 'rural_urban')
        }),
        ('Extra Details', {
            'classes': ('collapse',),
            'fields': ('worker_name', 'worker_number', 'helper_name', 'helper_number', 'supervisor_name', 'supervisor_number', 'cdpo_name', 'cdpo_number', 'male_teachers', 'female_teachers')
        }),
        ('Demographics', {
            'classes': ('collapse',),
            'fields': ('total_boys', 'total_girls')
        }),
        ('Safe Environment', {
            'classes': ('collapse',),
            'fields': ('household_covering_the_catchment_area', 'total_population_under_center', 'pregnant_mothers_in_population', 'lactating_mothers_in_population', 'total_childrens_in_population', 'shelves_in_kitchen', 'shelves_required_in_kitchen', 'shelves_in_store_room', 'shelves_required_in_store_room', 'shelves_in_playing_area',
            	'shelves_required_in_playing_area', 'building_paint', 'need_painting_in_building','need_flooring_in_building','flooring_requirement_description','need_ceiling_repair','ceiling_requirement_description',
            	'need_walls_repair', 'walls_repair_requirement_description', 'electricity_available', 'electric_bulbs', 'electric_bulbs_required', 'electric_fans_available', 'electric_fans_required',
            	'window_condition', 'need_window_repair', 'window_repair_description', 'door_condition', 'need_door_repair', 'door_repair_description', 'no_of_cooking_vessels', 'no_of_cooking_vessels_required',
            	'cooking_vessels_to_be_repaired', 'no_of_serving_vessels', 'no_of_serving_vessels_required', 'mats_available', 'no_of_mats', 'no_of_mats_required', 'mops_available', 'no_of_mops', 'no_of_mops_required',
            	 'broom_available', 'no_of_broom', 'no_of_broom_required', 'dustbin_available', 'no_of_dustbin', 'no_of_dustbin_required',
            	'plant_pots_available', 'plant_pots', 'plant_pots_required', 'green_cover', 'green_cover_required', 'cleanliness', 'cleanliness_description',
            	 'pest_control_done_in_last_one_year', 'pest_control_required', 'drinking_water', 'drinking_water_filter', 'no_of_drinking_water_filter', 'drinking_water_filter_required',
            	 'water_taps_in_kitchen', 'no_of_water_taps_in_kitchen', 'water_taps_in_kitchen_required', 'shelter_in_toilets', 'water_taps_in_toilets', 'no_of_water_taps_required_in_toilets', 'water_storage_containers_in_kitchen', 'no_of_water_storage_containers_required_in_kitchen'
            	 , 'water_storage_containers_in_toilets', 'no_of_water_storage_containers_required_in_toilets', 'toilet_available', 
            	 'toilet_functioning', 'toilet_boys', 'toilet_girls', 'toilet_doors_condition')
        }),
        ('Learning Environment', {
            'classes': ('collapse',),
            'fields': ('mural_art_available', 'mural_art_required',
            	'learning_and_playing_materials_available', 'learning_and_playing_materials_required',
            	'charts_available', 'charts_required', 'story_books_available', 'story_books_required', 
            	'drawing_and_art_materials_available', 'drawing_and_art_materials_required', 'library_kits_available', 'library_kits_required', 
            	'sports_material_available', 'sports_material_required', 'others_requirements')
        }),
        ('Mother Engagement', {
            'classes': ('collapse',),
            'fields': ('mothers_committee_formed', 'no_of_meetings_conducted_in_last_three_months', 
            	'meetings_documented_in_register', 'mothers_committee_feedback', 'bal_vikas_samiti_formed', 'bal_vikas_samiti_feedback', 'meetings_documented',
            	 'arrangements_for_the_children_with_specialneeds_feedback', 'arrangements_for_the_children_with_specialneeds_requirements')
        }),
    )
		

admin.site.register(Address,AddressAdmin)
admin.site.register(school, SchoolAdmin)
admin.site.register(District,DistrictAdmin)
admin.site.register(Boundary,BoundaryAdmin)
admin.site.register(type)