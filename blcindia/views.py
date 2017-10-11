# -*- coding: utf-8 -*-
from django import http
from django.views.generic.base import TemplateView


class StaticPageView(TemplateView):
    extra_context = {}
    def get_context_data(self, **kwargs):
        context = super(StaticPageView, self).get_context_data(**kwargs)
        context.update(self.extra_context)
        return context

