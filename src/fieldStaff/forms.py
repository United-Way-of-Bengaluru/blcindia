from __future__ import unicode_literals
from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Div, Submit, HTML, Button, Row, Field
from crispy_forms.bootstrap import AppendedText, PrependedText, FormActions, FieldWithButtons, StrictButton
from django.contrib.auth import get_user_model
from aanganwadi.models import school, Demographics, BasicFacilities, LearningEnvironment, SafeEnvironment, CommunityEngagement, Address, SchoolImages
from mapwidgets.widgets import GooglePointFieldWidget

User = get_user_model()


class schoolForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(schoolForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            Field('name', wrapper_class="schoolParentClass"),
            FieldWithButtons('address', StrictButton("Add New Address", css_class="btn btn-success", css_id="add_new_address_btn"), wrapper_class="schoolParentClass"),
            Field('type', wrapper_class="schoolParentClass"),
            Field('rural_urban', wrapper_class="schoolParentClass"),
            Field('building_status', wrapper_class="schoolParentClass"),
            Field('worker_name', wrapper_class="schoolParentClass"),
            Field('worker_number', wrapper_class="schoolParentClass"),
            Field('helper_name', wrapper_class="schoolParentClass"),
            Field('helper_number', wrapper_class="schoolParentClass"),
            Field('supervisor_name', wrapper_class="schoolParentClass"),
            Field('supervisor_number', wrapper_class="schoolParentClass"),
            Field('cdpo_name', wrapper_class="schoolParentClass"),
            Field('cdpo_number', wrapper_class="schoolParentClass"),
            Submit('save_school_info', 'Save School', css_class=" clearfix btn-success"),
            )

    class Meta:
        model = school
        fields = ['name', 'address', 'type', 'rural_urban', 'building_status', 'worker_name', 'worker_number', 'helper_name', 'helper_number', 'supervisor_name', 'supervisor_number', 'cdpo_name', 'cdpo_number']


class demographicsForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(demographicsForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            Field('school', wrapper_class="inputParentClass hidden"),
            Field('male_teachers', wrapper_class="inputParentClass"),
            Field('female_teachers', wrapper_class="inputParentClass"),
            Field('total_boys', wrapper_class="inputParentClass"),
            Field('total_girls', wrapper_class="inputParentClass"),
            Field('household_covering_the_catchment_area', wrapper_class="inputParentClass"),
            Field('total_population_under_center', wrapper_class="inputParentClass"),
            Field('total_childrens_in_population', wrapper_class="inputParentClass"),
            Submit('save_demographics', 'Save', css_class="btn-success"),
            )

    class Meta:
        model = Demographics
        fields = ['school', 'male_teachers', 'female_teachers', 'total_boys', 'total_girls', 'household_covering_the_catchment_area', 
        'total_population_under_center', 'total_childrens_in_population']


class BasicFacilitiesForm(forms.ModelForm):
    """docstring for BasicFacilitiesForm"""
    def __init__(self, *args, **kwargs):
        super(BasicFacilitiesForm, self).__init__()
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            
            Field('electricity_available', wrapper_class="inputParentClass"),
            Field('cleanliness', wrapper_class="inputParentClass"),
            Field('cleanliness_description', wrapper_class="inputParentClass"),
            Field('pest_control_done_in_last_one_year', wrapper_class="inputParentClass"),
            Field('pest_control_required', wrapper_class="inputParentClass"),
            Field('drinking_water', wrapper_class="inputParentClass"),
            Field('drinking_water_filter', wrapper_class="inputParentClass"),
            Field('drinking_water_filter_available', wrapper_class="inputParentClass"),
            Field('drinking_water_filter_required', wrapper_class="inputParentClass"),
            Field('electric_bulbs', wrapper_class="inputParentClass"),
            Field('electric_bulbs_required', wrapper_class="inputParentClass"),
            Field('electric_fans_available', wrapper_class="inputParentClass"),
            Field('electric_fans_required', wrapper_class="inputParentClass")
            )

    class Meta:
        model = BasicFacilities
        fields = ['school', 'electricity_available', 'cleanliness', 'cleanliness_description', 'pest_control_done_in_last_one_year', 'pest_control_required', 'drinking_water', 'drinking_water_filter', 'drinking_water_filter_available', 'drinking_water_filter_required', 'electric_bulbs', 'electric_bulbs_required', 'electric_fans_available', 'electric_fans_required']


class LearningEnvironmentForm(forms.ModelForm):
    """docstring for BasicFacilitiesForm"""
    def __init__(self, *args, **kwargs):
        super(LearningEnvironmentForm, self).__init__()
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            
            Field('learning_and_playing_materials_available', wrapper_class="inputParentClass"),
            Field('learning_and_playing_materials_required', wrapper_class="inputParentClass"),
            Field('charts_available', wrapper_class="inputParentClass"),
            Field('charts_required', wrapper_class="inputParentClass"),
            Field('story_books_available', wrapper_class="inputParentClass"),
            Field('story_books_required', wrapper_class="inputParentClass"),
            Field('drawing_and_art_materials_available', wrapper_class="inputParentClass"),
            Field('drawing_and_art_materials_required', wrapper_class="inputParentClass"),
            Field('library_kits_available', wrapper_class="inputParentClass"),
            Field('library_kits_required', wrapper_class="inputParentClass"),
            Field('sports_material_available', wrapper_class="inputParentClass"),
            Field('others_requirements', wrapper_class="inputParentClass"),
            )

    class Meta:
        model = LearningEnvironment
        fields = ['school', 'learning_and_playing_materials_available', 'learning_and_playing_materials_required', 'charts_available', 'charts_required', 'story_books_available', 'story_books_required', 'drawing_and_art_materials_available', 'drawing_and_art_materials_required', 'library_kits_available', 'library_kits_required', 'sports_material_available', 'others_requirements']


class SafeEnvironmentForm(forms.ModelForm):
    """docstring for BasicFacilitiesForm"""
    def __init__(self, *args, **kwargs):
        super(SafeEnvironmentForm, self).__init__()
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            
            Field('shelves_in_kitchen', wrapper_class="inputParentClass"),
            Field('shelves_required_in_kitchen', wrapper_class="inputParentClass"),
            Field('shelves_in_store_room', wrapper_class="inputParentClass"),
            Field('shelves_required_in_store_room', wrapper_class="inputParentClass"),
            Field('shelves_in_playing_area', wrapper_class="inputParentClass"),
            Field('shelves_required_in_playing_area', wrapper_class="inputParentClass"),
            Field('building_paint', wrapper_class="inputParentClass"),
            Field('need_painting_in_building', wrapper_class="inputParentClass"),
            Field('need_flooring_in_building', wrapper_class="inputParentClass"),
            Field('flooring_requirement_description', wrapper_class="inputParentClass"),
            Field('need_ceiling_repair', wrapper_class="inputParentClass"),
            Field('ceiling_requirement_description', wrapper_class="inputParentClass"),
            Field('need_walls_repair', wrapper_class="inputParentClass"),
            Field('walls_repair_requirement_description', wrapper_class="inputParentClass"),
            Field('window_condition', wrapper_class="inputParentClass"),
            Field('need_window_repair', wrapper_class="inputParentClass"),
            Field('window_repair_description', wrapper_class="inputParentClass"),
            Field('door_condition', wrapper_class="inputParentClass"),
            Field('need_door_repair', wrapper_class="inputParentClass"),
            Field('door_repair_description', wrapper_class="inputParentClass"),
            Field('no_of_cooking_vessels', wrapper_class="inputParentClass"),
            Field('no_of_cooking_vessels_required', wrapper_class="inputParentClass"),
            Field('cooking_vessels_to_be_repaired', wrapper_class="inputParentClass"),
            Field('no_of_serving_vessels', wrapper_class="inputParentClass"),
            Field('no_of_serving_vessels_required', wrapper_class="inputParentClass"),
            Field('mats_available', wrapper_class="inputParentClass"),
            Field('no_of_mats', wrapper_class="inputParentClass"),
            Field('no_of_mats_required', wrapper_class="inputParentClass"),
            Field('mops_available', wrapper_class="inputParentClass"),
            Field('no_of_mops', wrapper_class="inputParentClass"),
            Field('no_of_mops_required', wrapper_class="inputParentClass"),
            Field('broom_available', wrapper_class="inputParentClass"),
            Field('no_of_broom', wrapper_class="inputParentClass"),
            Field('no_of_broom_required', wrapper_class="inputParentClass"),
            Field('dustbin_available', wrapper_class="inputParentClass"),
            Field('no_of_dustbin', wrapper_class="inputParentClass"),
            Field('no_of_dustbin_required', wrapper_class="inputParentClass"),
            Field('plant_pots_available', wrapper_class="inputParentClass"),
            Field('plant_pots', wrapper_class="inputParentClass"),
            Field('plant_pots_required', wrapper_class="inputParentClass"),
            Field('green_cover', wrapper_class="inputParentClass"),
            Field('green_cover_required', wrapper_class="inputParentClass"),
            Field('water_taps_in_kitchen', wrapper_class="inputParentClass"),
            Field('no_of_water_taps_in_kitchen', wrapper_class="inputParentClass"),
            Field('water_taps_in_kitchen_required', wrapper_class="inputParentClass"),
            Field('shelter_in_toilets', wrapper_class="inputParentClass"),
            Field('water_taps_in_toilets', wrapper_class="inputParentClass"),
            Field('no_of_water_taps_required_in_toilets', wrapper_class="inputParentClass"),
            Field('water_storage_containers_in_kitchen', wrapper_class="inputParentClass"),
            Field('no_of_water_storage_containers_required_in_kitchen', wrapper_class="inputParentClass"),
            Field('toilet_available', wrapper_class="inputParentClass"),
            Field('toilet_functioning', wrapper_class="inputParentClass"),
            Field('toilet_boys', wrapper_class="inputParentClass"),
            Field('toilet_girls', wrapper_class="inputParentClass"),
            Field('toilet_doors_condition', wrapper_class="inputParentClass"),
            Field('mural_art_available', wrapper_class="inputParentClass"),
            Field('mural_art_required', wrapper_class="inputParentClass"),
            )

    class Meta:
        model = SafeEnvironment
        fields = ['school','shelves_in_kitchen','shelves_required_in_kitchen','shelves_in_store_room','shelves_required_in_store_room','shelves_in_playing_area','shelves_required_in_playing_area','building_paint','need_painting_in_building','need_flooring_in_building','flooring_requirement_description','need_ceiling_repair','ceiling_requirement_description','need_walls_repair','walls_repair_requirement_description','window_condition','need_window_repair','window_repair_description','door_condition','need_door_repair','door_repair_description','no_of_cooking_vessels','no_of_cooking_vessels_required','cooking_vessels_to_be_repaired',
                    'no_of_serving_vessels','no_of_serving_vessels_required','mats_available','no_of_mats','no_of_mats_required','mops_available','no_of_mops','no_of_mops_required','broom_available','no_of_broom',
                    'no_of_broom_required','dustbin_available','no_of_dustbin','no_of_dustbin_required','plant_pots_available','plant_pots','plant_pots_required','green_cover','green_cover_required','water_taps_in_kitchen','no_of_water_taps_in_kitchen','water_taps_in_kitchen_required','shelter_in_toilets','water_taps_in_toilets','no_of_water_taps_required_in_toilets','water_storage_containers_in_kitchen','no_of_water_storage_containers_required_in_kitchen','toilet_available','toilet_functioning','toilet_boys','toilet_girls','toilet_doors_condition','mural_art_available','mural_art_required',]





class CommunityEngagementForm(forms.ModelForm):
    """docstring for BasicFacilitiesForm"""
    def __init__(self, *args, **kwargs):
        super(CommunityEngagementForm, self).__init__()
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            
            Field('mothers_committee_formed', wrapper_class="inputParentClass"),
            Field('no_of_meetings_conducted_in_last_three_months', wrapper_class="inputParentClass"),
            Field('meetings_documented_in_register', wrapper_class="inputParentClass"),
            Field('mothers_committee_feedback', wrapper_class="inputParentClass"),
            Field('bal_vikas_samiti_formed', wrapper_class="inputParentClass"),
            Field('bal_vikas_samiti_feedback', wrapper_class="inputParentClass"),
            Field('meetings_documented', wrapper_class="inputParentClass"),
            Field('arrangements_for_the_children_with_specialneeds_feedback', wrapper_class="inputParentClass"),
            Field('arrangements_for_the_children_with_specialneeds_requirements', wrapper_class="inputParentClass"),
            Field('pregnant_mothers_in_population', wrapper_class="inputParentClass"),
            Field('lactating_mothers_in_population', wrapper_class="inputParentClass"),
            )

    class Meta:
        model = CommunityEngagement
        fields = ['school','mothers_committee_formed', 'no_of_meetings_conducted_in_last_three_months', 'meetings_documented_in_register',
         'mothers_committee_feedback', 'bal_vikas_samiti_formed', 'bal_vikas_samiti_feedback', 'meetings_documented', 'arrangements_for_the_children_with_specialneeds_feedback',
         'arrangements_for_the_children_with_specialneeds_requirements', 'pregnant_mothers_in_population', 'lactating_mothers_in_population']

class SchoolImageForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(SchoolImageForm, self).__init__()
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            
            Field('image', wrapper_class="inputAddressClass"),
            )

    class Meta:
        model = SchoolImages
        fields = ['school','image']
        

        
class AddressForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AddressForm, self).__init__()
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            Field('boundary', wrapper_class="inputAddressClass"),
            Field('address', wrapper_class="inputAddressClass"),
            Field('area', wrapper_class="inputAddressClass"),
            Field('pincode', wrapper_class="inputAddressClass"),
            Field('landmark', wrapper_class="inputAddressClass"),
            Field('location', wrapper_class="inputAddressClass"),
            Field('instidentification', wrapper_class="inputAddressClass"),
            Submit('save_address', 'Save', css_class="btn-success"),
            )

    class Meta:
        model = Address
        fields = ['boundary', 'address', 'area', 'pincode', 'landmark', 'location', 'instidentification']
        widgets = {
            'location': GooglePointFieldWidget
        }


        