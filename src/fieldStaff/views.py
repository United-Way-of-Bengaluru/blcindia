# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse_lazy
from django.shortcuts import render

# Create your views here.
from django.utils.decorators import method_decorator
from django.views.generic import CreateView
from django.views.generic import DetailView
from django.views.generic import ListView
from django.views.generic import UpdateView
# from django.views.generic.edit import UpdateView
from blcindia import settings
from aanganwadi.models import school, Type



@method_decorator(login_required, name='dispatch')
class SchoolListView(ListView):
    model = school
    template_name = 'fieldstaff/school_list.html'

    def get_context_data(self, **kwargs):
        context = super(SchoolListView, self).get_context_data(**kwargs)
        return context

@method_decorator(login_required, name='dispatch')
class SchoolCreateView(CreateView):
    model = school
    fields = '__all__'
    success_url = reverse_lazy('school_list')
    template_name = 'fieldstaff/add_school.html'


    def form_valid(self, form):
        self.request.user.first_name = self.request.POST.get('first_name')
        self.request.user.last_name = self.request.POST.get('last_name')
        self.request.user.save()
        return super(SchoolCreateView, self).form_valid(form)

    def get_context_data(self, **kwargs):
        print 'function called  '
        ctx = super(SchoolCreateView, self).get_context_data(**kwargs)
        try:
            user_data = User.objects.filter(username=self.request.user).first()
            ctx['user'] = User.objects.filter(username=self.request.user).first()
            ctx['profile'] = Profile.objects.filter(user=self.request.user).first()
            ctx['school_type'] = Type.objects.all()
            ctx['domain'] = settings.DOMAIN
            print ctx
        except Exception as e:
            pass
        return ctx



@method_decorator(login_required, name='dispatch')
class SchoolDetailView(DetailView):
    model = school
    template_name = 'fieldstaff/school_detail.html'

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(SchoolDetailView, self).get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        context['school'] = school.objects.all()
        return context

