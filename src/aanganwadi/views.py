# -*- coding: utf-8 -*-
from django import http
from django.shortcuts import get_object_or_404
from django.views.generic.base import TemplateView

from django.views.generic.detail import DetailView
from rest_framework import generics
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import APIException

from blcindia.views import StaticPageView
from aanganwadi.models import school, Boundary,Address, AcademicYear, SafeEnvironment, BasicFacilities
from aanganwadi.serializers import SchoolSerializer, SchoolSerializerAll, SchoolSerializerDemographics, \
    SchoolSerializerInfrastructure, BasicFacilitiesSerializer, BasicInfrastructureSerializer
from django.core.urlresolvers import reverse


from django.shortcuts import redirect

def login_success(request):
    """
    Redirects users based on whether they are in the admins group
    """
    print 'function calleddddddddddddd'
    print request.user.groups
    if request.user.groups.filter(name="field_engineer").exists():
        # user is an admin
        return redirect("admin_list")
    else:
        return redirect("other_view")


class AdvancedMapView(StaticPageView):
    template_name = 'advanced_map.html'
    extra_context = {
        'hide_footer': True,
    }

class SchoolPageView(DetailView):
    model = school
    template_name = 'front/school.html'

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(SchoolPageView, self).get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        school = context['object']
        print school, "Line 31"
        # FIXME: there really should be a better way of handling school / preschool
        # Ideally, this would be better naming of "Boundary Type" and then just use that
        school_type = school.type.name
        context['breadcrumbs'] = [
            {
                'url': reverse('map'),
                'name': 'Map'
            },
            {
                'url': reverse('school_page', kwargs={'pk': school.id}),
                'name': '%s: %s' % (school_type, school.name,)
            }
        ]
        return context


class APIError(APIException):
    '''
        Custom exception. Can be raised with something like:
            raise APIError("some error message", status_code=501)
        This is then handled by the middleware to return a JSON
        error message with supplied status code
    '''

    def __init__(self, message, status_code=500):
        self.status_code = status_code
        self.detail = message


class SchoolsData(viewsets.ModelViewSet):
    """
    A viewset for viewing and editing user instances.
    """
    serializer_class = SchoolSerializer
    queryset = school.objects.all()

    def list(self, request):
        queryset = school.objects.all()
        serializer = SchoolSerializerAll(queryset, many=True)
        dict ={
            "type": "FeatureCollection",
            "features": serializer.data
        }
        return Response(dict)

    def retrieve(self, request, school_id=None):
        queryset = school.objects.all()
        schoolId = get_object_or_404(queryset, pk=school_id)
        serializer = SchoolSerializer(schoolId)

        #get_geom = self.request.GET.get('geometry', 'no')
        if 'geometry' in self.request.GET:
            dict ={
                "type": "Feature",
                "properties": serializer.data,
                #"geometry": serializer.data.geometry
            }
            return Response(dict)
        else:
            return Response(serializer.data)

class SchoolsDataDemographics(viewsets.ModelViewSet):
    queryset = school.objects.all()
    def retrieve(self, request, school_id=None):

        # queryset = Demographics.objects.all()
        # demographicsdata = get_object_or_404(queryset, pk=school_id)
        # serializer = SchoolSerializerDemographics(school_id)


        school_data = school.objects.filter(id=school_id).values('name').first()

        demographicsdata = school.objects.filter(school=school_id).values('total_boys','total_girls','id').first()

        if school_data is not None:
            school_name = school_data['name']
        else:
            school_name =''


        dict = {
            # "sex": "co-ed",
            # "moi": "kannada",
            # "mgmt": "ed",
            "id": demographicsdata['id'],
            "name": school_name,
            "num_boys_dise": demographicsdata['total_boys'],
            "num_girls_dise": demographicsdata['total_girls'],
            "num_boys": demographicsdata['total_boys'],
            "num_girls": demographicsdata['total_girls'],
            # "mt_profile":
            #     {"tamil": 10, "kannada": 28},
            # "acyear": '',


            }
        return Response(dict)




class SchoolsDataInfrastructure(viewsets.ModelViewSet):
    queryset = school.objects.all()

    def retrieve(self, request, school_id=None):
        queryset = school.objects.all()
        schoolId = get_object_or_404(queryset, pk=school_id)


        serializer = BasicInfrastructureSerializer(schoolId)
        return Response(serializer.data)


        # response = serializer.data

        # dict = {
        #     "id": response['id'],
        #     "name": response['name'],
        #     "num_boys": response['total_boys'],
        #     "num_girls": response['total_girls'],
        #     "facilities":{
        #         "Toilet Facilities":
        #             {
        #                 "has_toilets": response['toilet_available'],
        #                 "has_usable_toilets": response['toilet_functioning'],
        #                 "has_shelters_for_toilets": response['shelter_in_toilets']
        #             },
        #         "Community Involvement":
        #             {
        #                 "Mothers committee formed": response['mothers_committee_formed'],
        #                 "Bal vikas samiti formed": response['bal_vikas_samiti_formed'],
        #             },
        #         "Basic Infrastructure":
        #             {
        #                 "has_spacious_classrooms and Play Isas": 0,
        #                 "has_walls_intact": response['need_walls_repair'],
        #                 "has_flooring_intact": response['need_flooring_in_building'],
        #                 "has_waste_baskets": response['dustbin_available'],
        #                 "has_roofs_intact": 1,
        #
        #             },
        #         "Learning Environment":
        #             {
        #                 "learning_and_playing_materials_available": response['learning_and_playing_materials_available'],
        #                 "charts_available": response['charts_available'],
        #                 "story_books_available": response['story_books_available'],
        #                 "drawing_and_art_materials_available": response['drawing_and_art_materials_available'],
        #                 "library_kits_available": response['library_kits_available'],
        #                 "sports_material_available": response['sports_material_available'],
        #             },
        #         "Nutrition and Hygiene":
        #             {
        #                 "has_drinking_water_facilities": response['drinking_water'],
        #                 "has_clean_and_timely_meals": 0,
        #                 "has_handwash_facilities": 0
        #             }
        #     }
        #

        #      }
        # # return Response(dict)
        # return Response(dict)


class BLCINDIA_APIView(APIView):
    pass

class BoundarySummaryReport(viewsets.ModelViewSet):
    """
    A viewset for viewing and editing user instances.
    """
    serializer_class = SchoolSerializer
    queryset = school.objects.all()
    
    def list(self, request):
        queryset = school.objects.all()
        serializer = SchoolSerializerAll(queryset, many=True)
        self.reportInfo ={}
        year = 2017
        self.reportInfo["academic_year"] = year
        self.reportInfo["gender"] = {"boys": 0,
                                     "girls": 0}
        self.reportInfo["student_count"] = 0
        self.reportInfo["school_count"] = 0
        self.reportInfo['electricity_available'] = 0
        self.reportInfo['electricity_notdefined'] = 0
        self.reportInfo['electricity_notavailable'] = 0

        self.reportInfo['cleanliness'] = 0
        self.reportInfo['cleanliness_notdefined'] = 0
        self.reportInfo['no_cleanliness'] = 0

        self.reportInfo['pest_control_done_in_last_one_year'] = 0
        self.reportInfo['pest_control_done_in_last_one_year_notdefined'] = 0
        self.reportInfo['no_pest_control_done_in_last_one_year'] = 0

        self.reportInfo['drinking_water_filter'] = 0
        self.reportInfo['drinking_water_filter_notdefined'] = 0
        self.reportInfo['no_drinking_water_filter'] = 0


        self.reportInfo['report_info'] = {'name': 'Report'}
        print serializer.data
        for item in serializer.data:
	    print item
            self.reportInfo["school_count"] += 1
            if item["num_boys"] != None:
                self.reportInfo["gender"]["boys"] += int(item["num_boys"])
                self.reportInfo["gender"]["girls"] += int(item["num_girls"])
                self.reportInfo["student_count"] += (int(item["num_boys"]) + int(item["num_girls"]))
                if 'basicfacilities' in item:

                    if 'electricity_available' in item['basicfacilities']:
                        if item['basicfacilities']['electricity_available'] is not None:
                            if item['basicfacilities']['electricity_available'] == True:
                                self.reportInfo['electricity_available'] += 1
                            else:
                                self.reportInfo['electricity_notavailable'] += 1
                        else:
                            self.reportInfo['electricity_notdefined'] += 1
                    else:
                        self.reportInfo['electricity_notdefined'] += 1

                    if 'cleanliness' in item['basicfacilities']:
                        if item['basicfacilities']['cleanliness'] is not None:
                            if item['basicfacilities']['cleanliness'] == True:
                                self.reportInfo['cleanliness'] += 1
                            else:
                                self.reportInfo['no_cleanliness'] += 1
                        else:
                            self.reportInfo['cleanliness_notdefined'] += 1
                    else:
                        self.reportInfo['cleanliness_notdefined'] += 1

                    if 'pest_control_done_in_last_one_year' in item['basicfacilities']:
                        if item['basicfacilities']['pest_control_done_in_last_one_year'] is not None:
                            if item['basicfacilities']['pest_control_done_in_last_one_year'] == True:
                                self.reportInfo['pest_control_done_in_last_one_year'] += 1
                            else:
                                self.reportInfo['no_pest_control_done_in_last_one_year'] += 1
                        else:
                            self.reportInfo['pest_control_done_in_last_one_year_notdefined'] += 1
                    else:
                        self.reportInfo['pest_control_done_in_last_one_year_notdefined'] += 1


                    if 'drinking_water_filter' in item['basicfacilities']:
                        if item['basicfacilities']['drinking_water_filter'] is not None:
                            if item['basicfacilities']['drinking_water_filter'] == True:
                                self.reportInfo['drinking_water_filter'] += 1
                            else:
                                self.reportInfo['no_drinking_water_filter'] += 1
                        else:
                            self.reportInfo['drinking_water_filter_notdefined'] += 1
                    else:
                        self.reportInfo['drinking_water_filter_notdefined'] += 1
                        

                else:
                    self.reportInfo['electricity_notdefined'] += 1

        return Response(self.reportInfo)
