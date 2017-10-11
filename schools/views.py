# -*- coding: utf-8 -*-
from django import http
from django.shortcuts import get_object_or_404
from django.views.generic.base import TemplateView

from django.views.generic.detail import DetailView
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import APIException

from blcindia.views import StaticPageView
from schools.models import school, Boundary,Address, AcademicYear
from schools.serializers import SchoolSerializer, SchoolSerializerAll, SchoolSerializerDemographics, \
    SchoolSerializerInfrastructure
from django.core.urlresolvers import reverse




class AdvancedMapView(StaticPageView):
    template_name = 'advanced_map.html'
    extra_context = {
        'hide_footer': True,
    }

class SchoolPageView(DetailView):
    model = school
    template_name = 'school.html'

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
        print 'retrieve fnctino called'
        queryset = school.objects.all()
        schoolId = get_object_or_404(queryset, pk=school_id)
        serializer = SchoolSerializer(schoolId)
        return Response(serializer.data)

class SchoolsDataDemographics(viewsets.ModelViewSet):
    queryset = school.objects.all()
    def retrieve(self, request, school_id=None):
        queryset = school.objects.all()
        schoolId = get_object_or_404(queryset, pk=school_id)
        serializer = SchoolSerializerDemographics(schoolId)
        dict = {
            "sex": "co-ed",
            "moi": "kannada",
            "mgmt": "ed",
            "num_boys_dise": serializer.data['num_boys'],
            "num_girls_dise": serializer.data['num_girls'],
            "num_boys": serializer.data['num_boys'],
            "num_girls": serializer.data['num_girls'],
            "mt_profile":
                {"tamil": 10, "kannada": 28},
            "acyear": 'null',
            "id":serializer.data['id'],
            "name":serializer.data['name'],
            }
        return Response(dict)

class SchoolsDataInfrastructure(viewsets.ModelViewSet):
    queryset = school.objects.all()

    def retrieve(self, request, school_id=None):
        queryset = school.objects.all()
        schoolId = get_object_or_404(queryset, pk=school_id)
        serializer = SchoolSerializerInfrastructure(schoolId)
        response = serializer.data
        dict = {
            "id": response['id'],
            "name": response['name'],
            "num_boys": response['total_boys'],
            "num_girls": response['total_girls'],
            "facilities":{
                "Toilet Facilities":
                    {
                        "has_toilets": response['toilet_available'],
                        "has_usable_toilets": response['toilet_functioning'],
                        "has_shelters_for_toilets": response['shelter_in_toilets']
                    },
                "Community Involvement":
                    {
                        "Mothers committee formed": response['mothers_committee_formed'],
                        "Bal vikas samiti formed": response['bal_vikas_samiti_formed'],
                    },
                "Basic Infrastructure":
                    {
                        "has_spacious_classrooms and Play Isas": 0,
                        "has_walls_intact": response['need_walls_repair'],
                        "has_flooring_intact": response['need_flooring_in_building'],
                        "has_waste_baskets": response['dustbin_available'],
                        "has_roofs_intact": 1,

                    },
                "Learning Environment":
                    {
                        "learning_and_playing_materials_available": response['learning_and_playing_materials_available'],
                        "charts_available": response['charts_available'],
                        "story_books_available": response['story_books_available'],
                        "drawing_and_art_materials_available": response['drawing_and_art_materials_available'],
                        "library_kits_available": response['library_kits_available'],
                        "sports_material_available": response['sports_material_available'],
                    },
                "Nutrition and Hygiene":
                    {
                        "has_drinking_water_facilities": response['drinking_water'],
                        "has_clean_and_timely_meals": 0,
                        "has_handwash_facilities": 0
                    }
            }

            }
        return Response(dict)

class BLCINDIA_APIView(APIView):
    pass

class BoundarySummaryReport(BLCINDIA_APIView):
    '''
        Returns report summary
    '''
    reportInfo = {"report_info": {}}
    parentInfo = {}

    # filling the counts in the data structure to be returned
    def get_counts(self, boundaryData, active_schools, academic_year):
        self.reportInfo["gender"] = {"boys": 0,
                                     "girls": 0}
        self.reportInfo["student_count"] = 0
        self.reportInfo["school_count"] = boundaryData["num_schools"]
        for data in boundaryData["cat"]:
            if data["cat"] in ['Lower Primary', 'Upper Primary', 'Model Primary']:
                self.reportInfo["gender"]["boys"] += data["num_boys"]
                self.reportInfo["gender"]["girls"] += data["num_girls"]
                self.reportInfo["student_count"] += data["num_boys"] + data["num_girls"]
        self.reportInfo["teacher_count"] =\
            self.get_teachercount(active_schools, academic_year)

        if self.reportInfo["teacher_count"] == 0:
            self.reportInfo["ptr"] = "NA"
        else:
            self.reportInfo["ptr"] = round(
                self.reportInfo["student_count"] /
                float(self.reportInfo["teacher_count"]), 2)

        if self.parentInfo["schoolcount"] == 0:
            self.reportInfo["school_perc"] = 100
        else:
            self.reportInfo["school_perc"] = round(
                self.reportInfo["school_count"] *
                100 / float(self.parentInfo["schoolcount"]), 2)

    def get_boundary_data(self, boundary_id):
        #settings.DEFAULT_ACADEMIC_YEAR
        # Get the academic year
        year = self.request.GET.get('year', '2017')
        # try:
        #     academic_year = AcademicYear.objects.get(name=year)
        # except AcademicYear.DoesNotExist:
        #     raise APIError('Academic year is not valid.\
        #             It should be in the form of 2011-2012.', 404)
        self.reportInfo["academic_year"] = year

        # Check if boundary id is valid
        try:
            Address = Address.objects.filter(boundary_id=boundary_id).all()
        except Exception:
            raise APIError('Boundary not found', 404)

        # Get list of schools associated with that boundary
        active_schools = Address.schools()

        # Get aggregate data for schools in that boundary for the current
        # academic year
        boundaryData = self.get_aggregations(active_schools, academic_year)
        boundaryData = self.check_values(boundaryData)

        # get information about the parent
        self.parentInfo = self.get_parent_info(boundary)

        # get the summary data
        self.get_boundary_summary_data(boundary, self.reportInfo)

        # get the counts of students/gender/teacher/school
        self.get_counts(boundaryData, active_schools, academic_year)

    def get(self, request):
        if not self.request.GET.get('id'):
            raise ParseError("Mandatory parameter id not passed")

        id = self.request.GET.get("id")
        self.get_boundary_data(id)
        return Response(self.reportInfo)