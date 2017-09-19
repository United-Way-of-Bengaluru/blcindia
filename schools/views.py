# -*- coding: utf-8 -*-
from django import http
from django.shortcuts import get_object_or_404
from django.views.generic.base import TemplateView

from django.views.generic.detail import DetailView
from rest_framework import viewsets
from rest_framework.response import Response

from blcindia.views import StaticPageView
from schools.models import school
from schools.serializers import SchoolSerializer, SchoolSerializerAll


class AdvancedMapView(StaticPageView):
    template_name = 'advanced_map.html'
    extra_context = {
        'hide_footer': True,
    }

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
            "features": [
                serializer.data
            ]
        }
        return Response(dict)

    def retrieve(self, request, school_id=None):
        print 'retrieve fnctino called'
        queryset = school.objects.all()
        user = get_object_or_404(queryset, pk=school_id)
        serializer = SchoolSerializer(user)
        return Response(serializer.data)