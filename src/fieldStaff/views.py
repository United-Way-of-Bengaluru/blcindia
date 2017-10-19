# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse_lazy
from django.shortcuts import render
from django.shortcuts import get_object_or_404, redirect
from django.contrib import messages

# Create your views here.
from django.utils.decorators import method_decorator
from django.views.generic import CreateView
from django.views.generic import DetailView
from django.views.generic import ListView
from django.views.generic import UpdateView
from django.views.generic import TemplateView
# from django.views.generic.edit import UpdateView
from blcindia import settings
from aanganwadi.models import school, Type

import forms



@method_decorator(login_required, name='dispatch')
class SchoolListView(ListView):
    model = school
    template_name = 'fieldstaff/school_list.html'

    def get_context_data(self, **kwargs):
        context = super(SchoolListView, self).get_context_data(**kwargs)
        return context

@method_decorator(login_required, name='dispatch')
class SchoolCreateView(TemplateView):
    template_name = 'fieldstaff/add_school.html'
    http_method_names = ['get', 'post']

    def get(self, request, *args, **kwargs):
        user = self.request.user
        if "user_form" not in kwargs:
            kwargs["school_form"] = forms.schoolForm()
        return super(SchoolCreateView, self).get(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        user = self.request.user
        school_form = forms.schoolForm(request.POST)
        print school_form.is_valid()
        if not school_form.is_valid():
            messages.error(request, "There was a problem with the form. "
                           "Please check the details.")
            school_form = forms.schoolForm()
            return super(SchoolCreateView, self).get(request,
                                                school_form=school_form)
        # Both forms are fine. Time to save!
        school_form.save()
        messages.success(request, "School details saved!")
        return redirect("fieldstaff:school_list")


    # model = school
    # fields = '__all__'
    # success_url = reverse_lazy('school_list')
    # template_name = 'fieldstaff/add_school.html'


    # def form_valid(self, form):
    #     self.request.user.first_name = self.request.POST.get('first_name')
    #     self.request.user.last_name = self.request.POST.get('last_name')
    #     self.request.user.save()
    #     return super(SchoolCreateView, self).form_valid(form)

    # def get_context_data(self, **kwargs):
    #     print 'function called  '
    #     ctx = super(SchoolCreateView, self).get_context_data(**kwargs)
    #     try:
    #         user_data = User.objects.filter(username=self.request.user).first()
    #         ctx['user'] = User.objects.filter(username=self.request.user).first()
    #         ctx['profile'] = Profile.objects.filter(user=self.request.user).first()
    #         ctx['school_type'] = Type.objects.all()
    #         ctx['domain'] = settings.DOMAIN
    #         print ctx
    #     except Exception as e:
    #         pass
    #     return ctx



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

