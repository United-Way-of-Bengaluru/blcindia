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
    boundary = serializers.SerializerMethodField()


    def get_address_full(self, obj):
        if obj.address_id:
            return obj.address_id.full
        else:
            return {}

    def get_geometry(self, obj):
        if obj.address_id:
            dict ={
                "type": "Point",
                "coordinates":str(obj.address_id.location)
            }
            return dict
        else:
            return {}

    def get_boundary(self, obj):
        if obj.address_id.boundary_id:
            dict = {
                'id':obj.address_id.boundary_id.district.id,
                'name':obj.address_id.boundary_id.district.name,
                'dise_slug':'null',
                'type':'district',
                'school_type': obj.address_id.boundary_id.district.school_type,
                'status':obj.address_id.boundary_id.district.status
            }
            return dict
            # dist =  obj.address_id.boundary_id.district
            # district = DistrictSerializer.augment_field(dist)
            # return district
        else:
            return {}

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
        fields = ('school_code','name','address_full','geometry','boundary')


class SchoolSerializer(serializers.ModelSerializer):
    address_full = serializers.SerializerMethodField()
    landmark = serializers.SerializerMethodField()
    district = serializers.SerializerMethodField()


    def get_address_full(self, obj):
        if obj.address_id:
            return obj.address_id.full
        else:
            return {}



    def get_landmark(self, obj):
        if obj.address_id:
            return obj.address_id.landmark
        else:
            return {}

    def get_district(self, obj):
        if obj.address_id.boundary_id:
            dict = {
                'id':obj.address_id.boundary_id.district.id,
                'name':obj.address_id.boundary_id.district.name,
                'dise_slug':'null',
                'type':'district',
                'school_type': obj.address_id.boundary_id.district.school_type,
                'status':obj.address_id.boundary_id.district.status
            }
            return dict
            # dist =  obj.address_id.boundary_id.district
            # district = DistrictSerializer.augment_field(dist)
            # return district
        else:
            return {}

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
        fields = ('school_code','name','address_full','landmark','district','num_boys','num_girls')
