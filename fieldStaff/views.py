# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

# Create your views here.
from django.views.generic import DetailView
from django.views.generic import ListView
from django.views.generic import UpdateView
# from django.views.generic.edit import UpdateView

from schools.models import school


class SchoolListView(ListView):
    model = school
    template_name = 'fieldstaff/school_list.html'

    def get_context_data(self, **kwargs):
        context = super(SchoolListView, self).get_context_data(**kwargs)
        return context


class SchoolDetailView(DetailView):
    model = school
    template_name = 'fieldstaff/school_detail.html'

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(SchoolDetailView, self).get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        context['school'] = school.objects.all()
        return context

class SchoolUpdateView(UpdateView):
    model = school
