# -*- coding: utf-8 -*-
from django import http
from django.views.generic.base import TemplateView

from django.views.generic.detail import DetailView
from blcindia.views import StaticPageView

class AdvancedMapView(StaticPageView):
    template_name = 'advanced_map.html'
    extra_context = {
        'hide_footer': True,
    }