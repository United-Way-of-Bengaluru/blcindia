# -*- coding: utf-8 -*-
from django import http
from rest_framework import permissions

from blcindia.views import StaticPageView
from rest_framework.decorators import permission_classes, api_view
from models import school
from serializers import schoolSerializer
from rest_framework import viewsets
class AdvancedMapView(StaticPageView):
    template_name = 'advanced_map.html'
    extra_context = {
        'hide_footer': True,
    }




class SchoolsData(viewsets.ModelViewSet):
    queryset = school.objects.all()
    serializer_class = schoolSerializer


@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
class SchoolsByCode(viewsets.ModelViewSet):
    def list(self, request, *args, **kwargs):
        print '-----------------------------------------'
        print self.kwargs['code']
        data = school.objects.filter(school_code=self.kwargs['code'])
        print data.query
        serializer_class = schoolSerializer
