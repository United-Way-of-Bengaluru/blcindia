# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.contrib.gis.db import models
from django.utils.safestring import mark_safe

from blcindia.settings import MEDIA_URL
from choices import ( YESNO, AREA, SCHOOL_CATEGORY, SCHOOL_MANAGEMENT , SCHOOL_TYPES,DISTRICT_STATUS, MEDIUM, MDM_STATUS, KITCHENSHED_STATUS,
    BOUNDARY_WALL, BUILDING_STATUS, DRINKING_WATER, PAINT_TYPE_CHOICES, YESNO_TYPE_CHOICES, condition_TYPE_CHOICES)


class StatusManager(models.Manager):
    def all_active(self):
        return self.filter(status=2)

    def all_inactive(self):
        return self.filter(status=1)

    def all_deleted(self):
        return self.filter(status=0)


class AcademicYear(models.Model):
    # id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=20, blank=True)
    to_year = models.IntegerField(null=True, blank=True)
    from_year = models.IntegerField(null=True, blank=True)

    def __unicode__(self):
        return "%s-%s" % (self.from_year, self.to_year)


class District(models.Model):
    name = models.CharField(max_length=100)
    dise_slug = models.CharField(max_length=100, blank=True, null=True)
    type = models.CharField(max_length=100, blank=True, null=True)
    school_type = models.CharField(max_length=100, blank=True, null=True)
    status= models.IntegerField(choices=DISTRICT_STATUS, default=2)

    def __unicode__(self):
        return str(self.name)


class Boundary(models.Model):
    block = models.CharField(max_length=100)
    # district = models.CharField(max_length=100)
    district = models.ForeignKey(District)

    def __unicode__(self):
        return str(self.block)


class Address(models.Model):
    boundary = models.ForeignKey(Boundary, null=True)
    address = models.CharField(max_length=1000, blank=True)
    area = models.CharField(max_length=1000, blank=True)
    pincode = models.CharField(max_length=20, blank=True)
    landmark = models.CharField(max_length=1000, blank=True)
    location = models.PointField(srid=4326)
    instidentification = models.CharField(max_length=1000, blank=True)
    objects = models.GeoManager()
    
    def __unicode__(self):
        return self.full

    @property
    def full(self):
        return ', '.join(filter(lambda x: bool(x.strip()) if x else False, [
            self.address, self.area, self.pincode
        ]))

    @property
    def identifiers(self):
        return self.get_identifiers()

    class Meta:
        #abstract = True
        verbose_name_plural = 'Addresses'

   #def __unicode__(self):
  #     return self.name

class Type(models.Model):
    """docstring for type"""
    # id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=True)

    def __unicode__(self):
        return self.name
   

class school(models.Model):
    name = models.CharField(max_length=200, blank=True)
    address = models.OneToOneField('Address', blank=True, null=True)
    type = models.ForeignKey('Type', blank=True, null=True)
    rural_urban = models.IntegerField(choices=AREA, null=True, blank=True)
    building_status = models.IntegerField(choices=BUILDING_STATUS, null=True, blank=True)
    worker_name = models.CharField(max_length=50, blank=True)
    worker_number = models.CharField(max_length=50, null=True, blank=True)
    helper_name = models.CharField(max_length=50, blank=True)
    helper_number = models.CharField(max_length=50, null=True, blank=True)
    supervisor_name = models.CharField(max_length=50, blank=True)
    supervisor_number = models.CharField(max_length=50, null=True, blank=True)
    cdpo_name = models.CharField(max_length=50, blank=True)
    cdpo_number = models.IntegerField(null=True, blank=True)

    # def demographics(self):
    #     return Demographics.objects.filter('school_id', self.id)

    def basic_facilities(self):
        return BasicFacilities.objects.filter('school_id', self.id)


    def __unicode__(self):
        return self.name


class Demographics(models.Model):
    school= models.OneToOneField('school')
    male_teachers = models.IntegerField(null=True, blank=True)
    female_teachers = models.IntegerField(null=True, blank=True)
    total_boys = models.IntegerField(blank=True, null=True, verbose_name='0-3 Yrs Childrens')
    total_girls = models.IntegerField(blank=True, null=True, verbose_name='3-6 Yrs Childrens')
    household_covering_the_catchment_area = models.IntegerField(null=True, blank=True)
    total_population_under_center = models.IntegerField(null=True, blank=True)
    total_childrens_in_population = models.IntegerField(null=True, blank=True)


    #objects = models.GeoManager()

    #To Do  - Will have to update this in model itself
    @property
    def num_boys(self):
        return self.total_boys

    @property
    def num_girls(self):
        return self.total_girls


class BasicFacilities(models.Model):
    school = models.OneToOneField('school')
    electricity_available = models.IntegerField(choices=YESNO, null=True, blank=True)
    cleanliness = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    cleanliness_description = models.CharField(max_length=200, blank=True)
    pest_control_done_in_last_one_year = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    pest_control_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    drinking_water = models.IntegerField(choices=DRINKING_WATER, null=True, blank=True)
    drinking_water_filter = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_drinking_water_filter = models.IntegerField(null=True, blank=True)
    drinking_water_filter_required = models.IntegerField(null=True, blank=True)
    electric_bulbs = models.IntegerField(null=True, blank=True)
    electric_bulbs_required = models.IntegerField(null=True, blank=True)
    electric_fans_available = models.IntegerField(null=True, blank=True)
    electric_fans_required = models.IntegerField(null=True, blank=True)


class LearningEnvironment(models.Model):
    school = models.OneToOneField('school')
    learning_and_playing_materials_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    learning_and_playing_materials_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    charts_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    charts_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    story_books_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    story_books_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    drawing_and_art_materials_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    drawing_and_art_materials_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    library_kits_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    library_kits_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    sports_material_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    sports_material_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    others_requirements = models.CharField(max_length=100, blank=True)


class SafeEnviroment(models.Model):
    school = models.OneToOneField('school')
    shelves_in_kitchen = models.IntegerField(null=True, blank=True)
    shelves_required_in_kitchen = models.IntegerField(null=True, blank=True)
    shelves_in_store_room = models.IntegerField(null=True, blank=True)
    shelves_required_in_store_room = models.IntegerField(null=True, blank=True)
    shelves_in_playing_area = models.IntegerField(null=True, blank=True)
    shelves_required_in_playing_area = models.IntegerField(null=True, blank=True)
    building_paint = models.CharField(max_length=50, choices=PAINT_TYPE_CHOICES, blank=True)
    need_painting_in_building = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    need_flooring_in_building = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    flooring_requirement_description = models.CharField(max_length=200, blank=True)
    need_ceiling_repair = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    ceiling_requirement_description = models.CharField(max_length=200, blank=True)
    need_walls_repair = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    walls_repair_requirement_description = models.CharField(max_length=200, blank=True)
    window_condition = models.IntegerField(choices=condition_TYPE_CHOICES, null=True, blank=True)    
    need_window_repair = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    window_repair_description = models.CharField(max_length=200, blank=True)
    door_condition = models.IntegerField(choices=condition_TYPE_CHOICES, null=True, blank=True)    
    need_door_repair = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    door_repair_description = models.CharField(max_length=200, blank=True)
    no_of_cooking_vessels = models.IntegerField(null=True, blank=True)
    no_of_cooking_vessels_required = models.IntegerField(null=True, blank=True)
    cooking_vessels_to_be_repaired = models.IntegerField(null=True, blank=True)
    no_of_serving_vessels = models.IntegerField(null=True, blank=True)
    no_of_serving_vessels_required = models.IntegerField(null=True, blank=True)
    mats_available = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_mats = models.IntegerField(null=True, blank=True)
    no_of_mats_required = models.IntegerField(null=True, blank=True)
    mops_available = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_mops = models.IntegerField(null=True, blank=True)
    no_of_mops_required = models.IntegerField(null=True, blank=True)
    broom_available  = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_broom = models.IntegerField(null=True, blank=True)
    no_of_broom_required = models.IntegerField(null=True, blank=True)
    dustbin_available = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_dustbin = models.IntegerField(null=True, blank=True)
    no_of_dustbin_required = models.IntegerField(null=True, blank=True)
    plant_pots_available = models.IntegerField(choices=YESNO, null=True, blank=True)
    plant_pots = models.IntegerField(null=True, blank=True)
    plant_pots_required = models.IntegerField(null=True, blank=True)
    green_cover = models.IntegerField(choices=YESNO, null=True, blank=True)
    green_cover_required = models.IntegerField(null=True, blank=True)
    water_taps_in_kitchen  = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_water_taps_in_kitchen = models.IntegerField(null=True, blank=True)
    water_taps_in_kitchen_required = models.IntegerField(null=True, blank=True)
    shelter_in_toilets = models.IntegerField(choices=YESNO, null=True, blank=True)
    water_taps_in_toilets = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_water_taps_required_in_toilets = models.IntegerField(null=True, blank=True)
    water_storage_containers_in_kitchen = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_water_storage_containers_required_in_kitchen = models.IntegerField(null=True, blank=True)
    water_storage_containers_in_toilets = models.IntegerField(choices=YESNO, null=True, blank=True)
    no_of_water_storage_containers_required_in_toilets = models.IntegerField(null=True, blank=True)
    toilet_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    toilet_functioning = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    toilet_boys = models.IntegerField(null=True, blank=True)
    toilet_girls = models.IntegerField(null=True, blank=True)
    toilet_doors_condition = models.IntegerField(choices=condition_TYPE_CHOICES, null=True, blank=True)
    mural_art_available = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    mural_art_required = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)


class CommunityEngagement(models.Model):
    school = models.OneToOneField('school')
    mothers_committee_formed = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    no_of_meetings_conducted_in_last_three_months = models.IntegerField(null=True, blank=True)
    meetings_documented_in_register = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    mothers_committee_feedback =  models.CharField(max_length=200, blank=True)
    bal_vikas_samiti_formed =  models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    bal_vikas_samiti_feedback =  models.CharField(max_length=200, blank=True)
    meetings_documented = models.IntegerField(choices=YESNO_TYPE_CHOICES, null=True, blank=True)
    arrangements_for_the_children_with_specialneeds_feedback = models.CharField(max_length=200, blank=True)
    arrangements_for_the_children_with_specialneeds_requirements = models.CharField(max_length=200, blank=True)
    pregnant_mothers_in_population = models.IntegerField(null=True, blank=True)
    lactating_mothers_in_population = models.IntegerField(null=True, blank=True)



class SchoolImages(models.Model):
    school = models.ForeignKey(school)
    image = models.FileField(upload_to='schoolImages')

    def school_image(self):
        if self.image:
            return mark_safe('<img src=' + MEDIA_URL + '%s width="50" height="50" />' % (self.image))
            image.short_description = 'Image'
            image.allow_tags = True
        else:
            return 'No Image'


# from django.contrib.auth.models import User
# User._meta.get_field('email')._unique = True

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    about = models.TextField(blank=True)
    address = models.TextField(blank=True)
    profile_pic = models.FileField(upload_to='profile_pic', blank=True, null=True)
    mobile = models.CharField(max_length=12, null=True, blank=True)
    company = models.CharField(max_length=100,null=True, blank=True)
