from django.shortcuts import get_object_or_404
from rest_framework import serializers

from schools.models import school, Address, District


# class AddressSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Address
#         fields = ('landmark')


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



    def get_type(self, obj):
        return "Feature"

    def meeting_report(self, obj):
        if obj.communityengagement:
            dict={
                "no_of_meetings_conducted_in_last_three_months":str(obj.communityengagement.no_of_meetings_conducted_in_last_three_months),
                "meetings_documented_in_register":obj.communityengagement.meetings_documented_in_register,
                "meetings_documented":obj.communityengagement.meetings_documented
            }
            return dict
        else:
            return {}

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
            # "meeting_reports":SchoolSerializerAll.meeting_report(self,obj)
            "meeting_reports":""

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
        fields = ('geometry','type','properties')


class SchoolSerializer(serializers.ModelSerializer):
    address_full = serializers.SerializerMethodField()
    landmark = serializers.SerializerMethodField()
    district = serializers.SerializerMethodField()
    type = serializers.SerializerMethodField()
    basic_facilities = serializers.SerializerMethodField()

    def get_address_full(self, obj):
        if obj.address:
            return obj.address.full
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
                # 'id':obj.address.boundary_id.district.id,
                'name':obj.address.boundary_id.district.name,
                'dise_slug':'null',
                'type':'district',
                'school_type': obj.address.boundary_id.district.school_type,
                'status':obj.address.boundary_id.district.status
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
        dict = {
            "playground": False, 
            "library": False, 
            "computer_lab": False
        }
        return dict

    """
        "id": 29569,
        "name": "RAJAMIL HUTS",
        # "mgmt": "ed",
        # "cat": "Anganwadi",
        # "moi": "kannada",
        # "sex": "co-ed",
        "address_full": "4th Main Road, Rajamill Huts, Vallivarpuram, Malleshwaram, Bangalore, Malleshwaram, 560003",
        "landmark": "Near K.C.General Hospital",
        # "identifiers": "Light Orange Colour Building, Yellow Colour Door",
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
        fields = ('id','name','address_full','landmark','district', 'type', 'num_boys','num_girls', 'basic_facilities')

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
        model = school
        fields = ('id','name','num_boys','num_girls')

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