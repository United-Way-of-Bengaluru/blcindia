from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import serializers

from aanganwadi.models import school, Address, District, Demographics, BasicFacilities, CommunityEngagement, SafeEnvironment, \
    LearningEnvironment, SchoolImages


# class AddressSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Address
#         fields = ('landmark')


def meeting_reports(self, obj):
	community = CommunityEngagement.objects.filter(school=obj).values('no_of_meetings_conducted_in_last_three_months',
																	  'meetings_documented_in_register',
																	  'meetings_documented').first()
	if community is not None:
		return community
	else:
		return {}

class DistrictSerializer(serializers.ModelSerializer):
	class Meta:
		model = District
		fields = '__all__'

class SchoolSerializerAll(serializers.ModelSerializer):
	address_full = serializers.SerializerMethodField()
	geometry = serializers.SerializerMethodField()
	properties = serializers.SerializerMethodField()
	boundary = serializers.SerializerMethodField()
	type = serializers.SerializerMethodField()
	num_boys = serializers.SerializerMethodField()
	num_girls = serializers.SerializerMethodField()
	images = serializers.SerializerMethodField()


	def address_full(self, obj):
		if obj.address:
			return obj.address.full
		else:
			return {}

	def get_geometry(self, obj):
		if obj.address:
			dict ={
				"type": "Point",
				"coordinates": [obj.address.location.x, obj.address.location.y]
			}
			return dict
		else:
			return {}

	def boundary(self, obj):
		if obj.address.boundary:
			dict = {
				'id':obj.address.boundary.district.id,
				'name':obj.address.boundary.district.name,
				'block':obj.address.boundary.block,
				'dise_slug':'null',
				'type':'district',
				'school_type': obj.address.boundary.district.school_type,
				'status':obj.address.boundary.district.status
			}
			return dict
			# dist =  obj.address.boundary_id.district
			# district = DistrictSerializer.augment_field(dist)
			# return district
		else:
			return {}

	def get_images(self, obj):
		image = SchoolImages.objects.filter(school=obj).values('image').all()
		if boys is not None:
			return image['image']
		else:
			return None

	def get_num_boys(self, obj):
		boys = Demographics.objects.filter(school=obj).values('total_boys').first()
		if boys is not None:
			return boys['total_boys']
		else:
			return None

	def get_num_girls(self, obj):
		girls = Demographics.objects.filter(school=obj).values('total_girls').first()
		if girls is not None:
			return girls['total_girls']
		else:
			return None

	def get_type(self, obj):
		return "Feature"




	def get_properties(self, obj):
		dict = {
			"id": obj.id,
			"name": obj.name,
			"boundary":SchoolSerializerAll.boundary(self, obj),
			"address_full":SchoolSerializerAll.address_full(self,obj),
			"dise_info": "",
			"type": {
				"id": obj.type.id,
				"name": obj.type.name
			},
			"meeting_reports":meeting_reports(self,obj)
			# "meeting_reports":""

		}
		return dict

	"""
		{
		"type": "FeatureCollection",
		"features": [
		{
			"geometry":
			{
				"type": "Point",
				"coordinates": [77.56978, 12.98622]
			},
			"type": "Feature",
			"properties":
			{
				"id": 29551,
				"name": "HANUMANTHAPURA 1",
				"boundary":
				{
					"id": 8816,
					"name": "palace guttalli circle",
					"dise_slug": null,
					"type": "circle",
					"school_type": "preschool",
					"status": 2
				},
				# "admin1": "bangalore",
				# "admin2": "bangalore state",
				# "admin3": "palace guttalli circle",
				"address_full": "1st Main Road, Vivekananda Colony, Hanumanthapura, Sriramapuram, Bangalore, Hanumanthapura, 560021",
				"dise_info": "AN0037",
				"type":
				{
					"id": 2,
					"name": "PreSchool"
				},
				"meeting_reports": []
			}
		},
		]
	"""


	class Meta:
		model = school
		# fields = ('id','name','address_full', 'properties', 'type', 'geometry','boundary')
		fields = ('geometry','type','properties', 'num_boys', 'num_girls', 'images')



class SchoolSerializer(serializers.ModelSerializer):
	address_full = serializers.SerializerMethodField()
	identifiers = serializers.SerializerMethodField()
	cat = serializers.SerializerMethodField()
	landmark = serializers.SerializerMethodField()
	district = serializers.SerializerMethodField()
	type = serializers.SerializerMethodField()
	basic_facilities = serializers.SerializerMethodField()
	num_boys = serializers.SerializerMethodField()
	num_girls = serializers.SerializerMethodField()
	meeting_reports = serializers.SerializerMethodField()
	geometry = serializers.SerializerMethodField()

	def get_num_boys(self, obj):
		boys = Demographics.objects.filter(school=obj).values('total_boys').first()
		if boys is not None:
			return boys['total_boys']
		else:
			return None

	def get_geometry(self, obj):
		if obj.address:
			dict ={
				"type": "Point",
				"coordinates": [obj.address.location.x, obj.address.location.y]
			}
		else:
			return {}

	def get_num_girls(self, obj):
		girls = Demographics.objects.filter(school=obj).values('total_girls').first()
		if girls is not None:
			return girls['total_girls']
		else:
			return None

	def get_meeting_reports(self, obj):
		return meeting_reports(self,obj)

	def get_address_full(self, obj):
		if obj.address:
			return obj.address.full
		else:
			return {}

	def get_identifiers(self, obj):
		if obj.address.instidentification:
			return obj.address.instidentification
		else:
			return {}

	def get_landmark(self, obj):
		if obj.address:
			return obj.address.landmark
		else:
			return {}

	def get_district(self, obj):
		if obj.address.boundary_id:
			dict = {
				'id':obj.address.boundary.district.id,
				'name':obj.address.boundary.district.name,
				'dise_slug':'null',
				'type':'district',
				'school_type': obj.address.boundary.district.school_type,
				'status':obj.address.boundary.district.status
			}
			return dict
			# dist =  obj.address.boundary_id.district
			# district = DistrictSerializer.augment_field(dist)
			# return district
		else:
			return {}

	def get_type(self, obj):
		dict  = {
					"id": 2,
					"name": "PreSchool"
				}
		return dict

	def get_basic_facilities(self, obj):
		basicfacilities = BasicFacilities.objects.filter(school=obj).first()
		dict = {
			"playground": False, 
			"library": False, 
			"computer_lab": False
		}
		return dict

	def get_cat(self,obj):
		if obj.type:
			return obj.type.name
		else:
			return ''


	"""
		"id": 29569,
		"name": "RAJAMIL HUTS",
		# "mgmt": "ed",
		"cat": "Anganwadi",
		# "moi": "kannada",
		# "sex": "co-ed",
		"address_full": "4th Main Road, Rajamill Huts, Vallivarpuram, Malleshwaram, Bangalore, Malleshwaram, 560003",
		"landmark": "Near K.C.General Hospital",
		"identifiers": "Light Orange Colour Building, Yellow Colour Door",
		# "circle":{"id": 8816, "name": "palace guttalli circle", "dise_slug": null, "type": "circle", "school_type": "preschool", "status": 2}
		# "admin2": {"id": 8778, "name": "bangalore state", "dise_slug": null, "type": "project",
				   "school_type": "preschool", "status": 2}
		"district": {"id": 8773, "name": "bangalore", "dise_slug": null, "type": "district", "school_type": "preschool",
					 "status": 2},
		# "buses": "82,90, 95",
		# "ward": null,
		# "dise_code": "AN0068"
		# "type": {"id": 2, "name": "PreSchool"},
		"num_boys": "23",
		"num_girls": "15",
		# "basic_facilities": {"playground": false, "library": false, "computer_lab": false},
		# "images": ["/media/2ffebdaa066e5ef5000adca96072da6f.jpg", "/media/3cfbdc3d72d22637c2e6c6c162ce66ef.jpg"],
		# "has_volunteer_activities": false,
		# "meeting_reports": []
		}
	"""



	class Meta:
		model = school
		fields = ('id','name','cat','address_full','landmark','identifiers','district','type', 'num_boys', 'num_girls', 'basic_facilities', 'meeting_reports', 'geometry')

class SchoolSerializerDemographics(serializers.ModelSerializer):

	"""
	   response Data:
	   {
			"id": 29569,
			"name": "RAJAMIL HUTS",
			# "sex": "co-ed",
			# "moi": "kannada",
			# "mgmt": "ed",
			# "num_boys_dise": null,
			# "num_girls_dise": null,
			"num_boys": "23",
			"num_girls": "15",
			# "mt_profile":
			# {
			#     "tamil": 10,
			#     "kannada": 28
			# },
			# "acyear": null
		}
	"""


	class Meta:
		model = Demographics
		fields = ('id','total_boys','total_girls')

class BasicFacilitiesSerializer(serializers.ModelSerializer):
	class Meta:
		model = BasicFacilities
		fields = '__all__'



class SafeEnvironmentSerializer(serializers.ModelSerializer):
	class Meta:
		model = SafeEnvironment
		fields = '__all__'

class CommunityEngagementSerializer(serializers.ModelSerializer):
	class Meta:
		model = CommunityEngagement
		fields = '__all__'



def basic_facilities(self, obj):
	facilities = BasicFacilities.objects.filter(school=obj).values('no_of_meetings_conducted_in_last_three_months',
																	  'meetings_documented_in_register',
																	  'meetings_documented').first()
	if facilities is not None:
		return facilities
	else:
		return {}

def safe_environemnt(self,obj):
	safeEnvironment = SafeEnvironment.objects.filter(school=obj).values('need_walls_repair',)

class BasicInfrastructureSerializer(serializers.ModelSerializer):
	# activity = serializers.PrimaryKeyRelatedField()
	num_boys = serializers.SerializerMethodField()
	num_girls = serializers.SerializerMethodField()
	basic_facilities = serializers.SerializerMethodField()

	# safe = serializers.PrimaryKeyRelatedField(queryset=SafeEnvironment.objects.all(), required=False, allow_null=True)
	# safeEnvironment = safe_environemnt(self, obj)
	# safe_environment = SafeEnvironmentSerializer()
	# community = CommunityEngagementSerializer()

	num_boys = serializers.SerializerMethodField()
	num_girls = serializers.SerializerMethodField()
	facilities = serializers.SerializerMethodField()
	school_images = serializers.SerializerMethodField()
    # toilet_data = serializers.SerializerMethodField()
	# community_involvement = serializers.SerializerMethodField()
	# basic_infrastructure = serializers.SerializerMethodField()
	# learning_environment = serializers.SerializerMethodField()
	# nutrition_and_hygiene = serializers.SerializerMethodField()


	def get_num_boys(self, obj):
		boys = Demographics.objects.filter(school=obj).values('total_boys').first()
		if boys is not None:
			return boys['total_boys']
		else:
			return ''

	def get_num_girls(self, obj):
		girls = Demographics.objects.filter(school=obj).values('total_girls').first()
		if girls is not None:
			return girls['total_girls']
		else:
			return ''

	def get_basic_facilities(self, obj):
		basic = BasicFacilities.objects.filter(school=obj).values('electricity_available').first()
		if basic is not None:
			return basic['electricity_available']
		else:
			return ''

	def get_toilet_data(self, obj):
		toilet = SafeEnvironment.objects.filter(school=obj).values('toilet_available','toilet_functioning','shelter_in_toilets').first()
		if toilet is not None:
			return toilet
		else:
			return ''

	def get_basic_infrastructure(self, obj):
		basicInfrastructure = SafeEnvironment.objects.filter(school=obj).values('need_walls_repair','need_flooring_in_building','dustbin_available','need_ceiling_repair').first()
		if basicInfrastructure is not None:
			return basicInfrastructure
		else:
			return ''
	def get_community_involvement(self, obj):
		communityInvolvement = CommunityEngagement.objects.filter(school=obj).values('mothers_committee_formed','bal_vikas_samiti_formed').first()
		if communityInvolvement is not None:
			return communityInvolvement
		else:
			return ''

	def get_learning_environment(self, obj):
		learningEnvironment = LearningEnvironment.objects.filter(school=obj).values('learning_and_playing_materials_available','charts_available','story_books_available','drawing_and_art_materials_available','library_kits_available','sports_material_available').first()
		if learningEnvironment is not None:
			return learningEnvironment
		else:
			return ''

	def get_nutrition_and_hygiene(self, obj):
		nutritionHygiene = BasicFacilities.objects.filter(school=obj).values('drinking_water').first()
		if nutritionHygiene is not None:
			return nutritionHygiene
		else:
			return ''

	def get_facilities(self, obj):

		toilet = SafeEnvironment.objects.filter(school=obj).values('toilet_available','toilet_functioning','shelter_in_toilets').first()		
		basicInfrastructure = SafeEnvironment.objects.filter(school=obj).values('need_walls_repair','need_flooring_in_building','dustbin_available','need_ceiling_repair').first()
		communityInvolvement = CommunityEngagement.objects.filter(school=obj).values('mothers_committee_formed','bal_vikas_samiti_formed').first()
		learningEnvironment = LearningEnvironment.objects.filter(school=obj).values('learning_and_playing_materials_available','charts_available','story_books_available','drawing_and_art_materials_available','library_kits_available','sports_material_available').first()
		nutritionHygiene = BasicFacilities.objects.filter(school=obj).values('drinking_water').first()
		
		dict = {
		'Basic Infrastructure': basicInfrastructure,
		'Community Involvement': communityInvolvement,
		'Learning Environment': learningEnvironment,
		'Nutrition and Hygiene': nutritionHygiene,
		'Toilet Facilities': toilet,		
		}
		return dict

	def get_school_images(self, obj):
		schoolImages = SchoolImages.objects.filter(school=obj).values('image').first()
		if schoolImages is not None:
			return schoolImages
		else:
			return ''
    
	class Meta:
		model = school
		fields = ('name','num_boys','num_girls','basic_facilities', 'facilities', 'school_images')



class SchoolSerializerInfrastructure(serializers.ModelSerializer):
	"""
	   response Data:
	   {
			"Toilet Facilities":
			{
				"Has Usable Toilets": false,
				"Has Toilets": false,
				"Has Shelters for Toilets": false
			},
			"Community Involvement":
			{
				"Has Functional Bal Vikas Samithis": false
			},
			"Basic Infrastructure":
			{
				"Has Spacious Classrooms and Play Isas": false,
				"Has Walls Intact": true,
				"Has Flooring Intact": true,
				"Has Waste Baskets": false,
				"Has Roofs Intact": true,
				"Has Water Supply": false,
				"Is in a Designated Building by DWCD": false
			},
			"Learning Environment":
			{
				"Uses Akshara Foundation Teaching Kits": false,
				"Maintains Progress Records for Children": true,
				"Has Blackboards for Teaching": true
			},
			"Nutrition and Hygiene":
			{
				"Has Drinking Water Facilities": false,
				"Has Clean and Timely Meals": false,
				"Has Handwash Facilities": false
			}
		}
	"""


	class Meta:
		model = school
		# fields = ('id','name','num_boys','num_girls','toilet_available','toilet_functioning','shelter_in_toilets','need_walls_repair')
		fields = '__all__'
