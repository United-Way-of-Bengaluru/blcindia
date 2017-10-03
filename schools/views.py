# -*- coding: utf-8 -*-
from django import http
from django.shortcuts import get_object_or_404
from django.views.generic.base import TemplateView

from django.views.generic.detail import DetailView
from rest_framework import viewsets
from rest_framework.response import Response

from blcindia.views import StaticPageView
from schools.models import school
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
                        "Has Functional Bal Vikas Samithis": 0
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
                        "Uses Akshara Foundation Teaching Kits": 1,
                        "Maintains Progress Records for Children": 0,
                        "Has Blackboards for Teaching": 1
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

