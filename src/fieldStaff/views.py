# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse_lazy
from django.shortcuts import render
from django.shortcuts import get_object_or_404, redirect
from django.contrib import messages

from rest_framework import generics
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import APIException

# Create your views here.
from django.utils.decorators import method_decorator
from django.views.generic import CreateView
from django.views.generic import DetailView
from django.views.generic import ListView
from django.views.generic import UpdateView
from django.views.generic import TemplateView
from django.contrib.auth import logout
# from django.views.generic.edit import UpdateView
from blcindia import settings
from aanganwadi.models import school, Address, Type, BasicFacilities, LearningEnvironment, SafeEnvironment,  CommunityEngagement, SchoolImages
from serializers import AddressSerializer, BasicFacilitiesSerializer, LearningEnvironmentSerializer, SafeEnvironmentSerializer, CommunityEngagementSerializer, SchoolImagesSerializer 
import forms
from profiles.models import	Profile

def usercheck(request):
    user = request.user
    data = Profile.objects.filter(user=user.id).first()
    return data.user_type

@method_decorator(login_required, name='dispatch')
class SchoolListView(ListView):
	model = school
	template_name = 'fieldstaff/school_list.html'

	def get_context_data(self, **kwargs):
		# user = usercheck(self.request)
		# if user_type != "fieldstaff":
		# 	logout(self.request)
		# 	return redirect("home")
		context = super(SchoolListView, self).get_context_data(**kwargs)
		return context


@method_decorator(login_required, name='dispatch')
class SchoolCreateView(TemplateView):
	template_name = 'fieldstaff/add_school.html'
	http_method_names = ['get', 'post']

	def get(self, request, *args, **kwargs):
		user = self.request.user
		if "pk" in kwargs:
			pk = kwargs.get('pk')
			schoolData = school.objects.get(pk=pk)
			kwargs["school_form"] = forms.schoolForm(instance=schoolData)
		else:
			kwargs["school_form"] = forms.schoolForm()

		kwargs["address_form"] = forms.AddressForm()
		return super(SchoolCreateView, self).get(request, *args, **kwargs)

	def post(self, request, *args, **kwargs):
		user = self.request.user
		if "pk" in kwargs:
			pk = kwargs.get('pk')
			schoolData = school.objects.get(pk=pk)
			school_form = forms.schoolForm(request.POST, instance=schoolData)
		else:
			school_form = forms.schoolForm(request.POST) 

		address_form = forms.AddressForm()           

		if not school_form.is_valid():
			messages.error(request, "There was a problem with the form. "
						   "Please check the details.")
			if "pk" in kwargs:
				pk = kwargs.get('pk')
				schoolData = school.objects.get(pk=pk)
				kwargs["school_form"] = forms.schoolForm(instance=schoolData)
			else:
				kwargs["school_form"] = forms.schoolForm(request.POST)            
			return super(SchoolCreateView, self).get(request,
												school_form=school_form,
												address_form=address_form)
		# Both forms are fine. Time to save!
		schoolSavedData = school_form.save()
		print schoolSavedData.id
		messages.success(request, "School details saved!")
		return redirect("fieldstaff:periodicUpdate_school", pk=schoolSavedData.id)



@method_decorator(login_required, name='dispatch')
class SchoolBasicFacilities_View(TemplateView):
	template_name = 'fieldstaff/BasicFacilities_View.html'
	http_method_names = ['get', 'post']

	def get(self, request, *args, **kwargs):
		user = self.request.user
		if "pk" in kwargs:
			pk = kwargs.get('pk')
			schoolData = school.objects.get(pk=pk)
			
			try:
				BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
				kwargs["basic_facilities_form"] = forms.BasicFacilitiesForm(instance=BasicFacilitiesData)
			except BasicFacilities.DoesNotExist:
				print "BasicFacilities not found"
				kwargs["basic_facilities_form"] = forms.BasicFacilitiesForm()
		else:
			kwargs["basic_facilities_form"] = forms.BasicFacilitiesForm()

		return super(SchoolBasicFacilities_View, self).get(request, *args, **kwargs)

	def post(self, request, *args, **kwargs):
		user = self.request.user
		if "pk" in kwargs:
			pk = kwargs.get('pk')
			schoolData = school.objects.get(pk=pk)	
			try:
				BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
				basic_facilities_form = forms.BasicFacilitiesForm(instance=BasicFacilitiesData)
			except BasicFacilities.DoesNotExist:
				print "BasicFacilities not found"
				basic_facilities_form = forms.BasicFacilitiesForm()
		else:
			basic_facilities_form = forms.BasicFacilitiesForm()           

		#print basicfacilities_form
		if not basic_facilities_form.is_valid():
			messages.error(request, "There was a problem with the form. "
						   "Please check the details.")

			return super(SchoolBasicFacilities_View, self).get(request,
											basic_facilities_form= basic_facilities_form,
											)  

		basic_facilities_form.save()
		messages.success(request, "BasicFacilities details saved!")
		return redirect("fieldstaff:school_list")
			


@method_decorator(login_required, name='dispatch')
class SchoolperiodicUpdate_View(TemplateView):
	template_name = 'fieldstaff/periodicUpdate_school.html'
	http_method_names = ['get', 'post']

	def get(self, request, *args, **kwargs):
		user = self.request.user
		if "pk" in kwargs:
			pk = kwargs.get('pk')
			kwargs['school_id'] = pk
			schoolData = school.objects.get(pk=pk)
			kwargs["school_form"] = forms.schoolForm(instance=schoolData)

			# try:
			# 	demographicsData = school.objects.get(school=schoolData)
			# 	kwargs["demographics_form"] = forms.demographicsForm(instance=demographicsData)
			# except Demographics.DoesNotExist:
			# 	print "Demographics not found"
			# 	kwargs["demographics_form"] = forms.demographicsForm()

			kwargs["basic_facilities_form"] = forms.BasicFacilitiesForm() 
			kwargs["learning_environment_form"] = forms.LearningEnvironmentForm()
			kwargs["safe_environment_form"] = forms.SafeEnvironmentForm()
			kwargs["community_engagement_form"] = forms.CommunityEngagementForm()
			kwargs["school_images_form"] = forms.SchoolImageForm()

		else:
			kwargs["school_form"] = forms.schoolForm()
			#kwargs["demographics_form"] = forms.demographicsForm()
			kwargs["basic_facilities_form"] = forms.basic_facilities_form()
			kwargs["learning_environment_form"] = forms.LearningEnvironmentForm()
			kwargs["safe_environment_form"] = forms.SafeEnvironmentForm()
			kwargs["school_images_form"] = forms.SchoolImageForm()
			
		return super(SchoolperiodicUpdate_View, self).get(request, *args, **kwargs)

	def post(self, request, *args, **kwargs):
		user = self.request.user

		if 'save_school_info' in request.POST:
			print request.POST
			if "pk" in kwargs:
				pk = kwargs.get('pk')
				schoolData = school.objects.get(pk=pk)
				school_form = forms.schoolForm(request.POST, instance=schoolData)

				# try:
				# 	demographicsData = Demographics.objects.get(school=schoolData)
				# 	demographics_form = forms.demographicsForm(instance=demographicsData)
				# except Demographics.DoesNotExist:
				# 	demographics_form = forms.demographicsForm()

				
			else:
				school_form = forms.schoolForm(request.POST)  


			basic_facilities_form = forms.BasicFacilitiesForm() 
			LearningEnvironment_form = forms.LearningEnvironmentForm() 
			SafeEnvironment_form = forms.SafeEnvironmentForm() 
			community_engagement_form = forms.CommunityEngagementForm()
			school_images_form = forms.SchoolImageForm()

			if not school_form.is_valid():
				messages.error(request, "There was a problem with the form. "
							   "Please check the details.")           
				return super(SchoolperiodicUpdate_View, self).get(request,
													school_form=school_form, 
													#demographics_form = demographics_form,
													basic_facilities_form= basic_facilities_form,
													learning_environment_form=LearningEnvironment_form,
													safe_environment_form=SafeEnvironment_form,
													community_engagement_form=community_engagement_form)
			# Both forms are fine. Time to save!
			school_form.save()
			messages.success(request, "School details saved!")
			return redirect("fieldstaff:school_list")


		# if 'save_school_images' in request.POST:
		# 	print "Line 221"
		# 	school_images_form = forms.SchoolImageForm(request.POST)
		# 	if school_images_form.is_valid():
		# 		school_images_form.save()
		# 		messages.success(request, "School Images saved!")
		# 		return redirect("fieldstaff:school_list")
		# 	else:
		# 		messages.error(request, "There was a problem with the form. "
		# 					   "Please check the details.")
		# 		school_form = forms.schoolForm() 
		# 		basic_facilities_form = forms.BasicFacilitiesForm() 
		# 		LearningEnvironment_form = forms.LearningEnvironmentForm() 
		# 		SafeEnvironment_form = forms.SafeEnvironmentForm() 
		# 		community_engagement_form = forms.CommunityEngagementForm()

		# 		return super(SchoolperiodicUpdate_View, self).get(request,
		# 											school_form=school_form, 
		# 											#demographics_form = demographics_form,
		# 											basic_facilities_form= basic_facilities_form,
		# 											learning_environment_form=LearningEnvironment_form,
		# 											safe_environment_form=SafeEnvironment_form,
		# 											community_engagement_form=community_engagement_form)

		# if 'save_demographics' in request.POST:
		# 	print 'save_demographics'

		# 	if "pk" in kwargs:
		# 		pk = kwargs.get('pk')
		# 		schoolData = school.objects.get(pk=pk)
		# 		school_form = forms.schoolForm(instance=schoolData)
		# 		try:
		# 			demographicsData = Demographics.objects.get(school=schoolData)
		# 			demographics_form = forms.demographicsForm(request.POST, instance=demographicsData)
		# 		except Demographics.DoesNotExist:
		# 			demographics_form = forms.demographicsForm(request.POST) 

		# 	else:
		# 		demographics_form = forms.demographicsForm()  

		# 	basic_facilities_form = forms.BasicFacilitiesForm() 
		# 	LearningEnvironment_form = forms.LearningEnvironmentForm() 
		# 	SafeEnvironment_form = forms.SafeEnvironmentForm() 
		# 	community_engagement_form = forms.CommunityEngagementForm() 
		# 	school_images_form = forms.SchoolImageForm()         

		# 	print demographics_form

		# 	if not demographics_form.is_valid():
		# 		messages.error(request, "There was a problem with the form. "
		# 					   "Please check the details.")				
		# 		return super(SchoolperiodicUpdate_View, self).get(request,
		# 										school_form=school_form, 
		# 										demographics_form = demographics_form,
		# 										basic_facilities_form= basic_facilities_form,
		# 										learning_environment_form=LearningEnvironment_form,
		# 										safe_environment_form=SafeEnvironment_form,
		# 										community_engagement_form=community_engagement_form
		# 										)  

		# 	demographics_form.save()
		# 	messages.success(request, "Demographics details saved!")
		# 	return redirect("fieldstaff:school_list")



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


class AddNewAddress(viewsets.ModelViewSet):
	"""
	A viewset for viewing and editing user instances.
	"""
	serializer_class = AddressSerializer
	
	def add(self, request):
		if request.method == 'POST':
			serializer = AddressSerializer(data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data, status=status.HTTP_201_CREATED)
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)





class AddBasicFacilites(viewsets.ModelViewSet):
	"""
	A viewset for viewing and editing user instances.
	"""
	serializer_class = BasicFacilitiesSerializer

	def list(self, request, school_id=None):
		if request.method == 'GET':

			queryset = BasicFacilities.objects.filter(school=school_id).all()
			serializer = BasicFacilitiesSerializer(queryset, many=True)
			return Response(serializer.data)
	
	def add(self, request, school_id=None):
		if request.method == 'POST':
			serializer = BasicFacilitiesSerializer(data=request.data)
			safeEnvironmentserializer = SafeEnvironmentSerializer(data=request.data)			
			if serializer.is_valid():
				serializer.save()
				# return Response(serializer.data)
			if safeEnvironmentserializer.is_valid():
				safeEnvironmentserializer.save()
				return Response(safeEnvironmentserializer.data)
			return Response(serializer.errors)


class AddLearningEnvironment(viewsets.ModelViewSet):
	"""
	A viewset for viewing and editing user instances.
	"""
	serializer_class = LearningEnvironmentSerializer

	def list(self, request, school_id=None):
		if request.method == 'GET':
			queryset = LearningEnvironment.objects.filter(school=school_id).all()
			serializer = LearningEnvironmentSerializer(queryset, many=True)
			return Response(serializer.data)
	
	def add(self, request, school_id=None):
		if request.method == 'POST':
			serializer = LearningEnvironmentSerializer(data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data)
			return Response(serializer.errors)

class AddSafeEnvironment(viewsets.ModelViewSet):
	"""
	A viewset for viewing and editing user instances.
	"""
	serializer_class = SafeEnvironmentSerializer

	def list(self, request, school_id=None):
		if request.method == 'GET':
			queryset = SafeEnvironment.objects.filter(school=school_id).all()
			serializer = SafeEnvironmentSerializer(queryset, many=True)
			return Response(serializer.data)
	
	def add(self, request, school_id=None):
		if request.method == 'POST':
			serializer = SafeEnvironmentSerializer(data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data)
			return Response(serializer.errors)

class AddCommunityEngagement(viewsets.ModelViewSet):
	"""
	A viewset for viewing and editing user instances.
	"""
	serializer_class = LearningEnvironmentSerializer

	def list(self, request, school_id=None):
		if request.method == 'GET':
			queryset = CommunityEngagement.objects.filter(school=school_id).all()
			serializer = CommunityEngagementSerializer(queryset, many=True)
			return Response(serializer.data)
	
	def add(self, request, school_id=None):
		if request.method == 'POST':
			serializer = CommunityEngagementSerializer(data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data)
			return Response(serializer.errors)


class AddSchoolImages(viewsets.ModelViewSet):
	"""
	A viewset for viewing and editing user instances.
	"""
	serializer_class = SchoolImagesSerializer

	def list(self, request, school_id=None):
		if request.method == 'GET':
			queryset = SchoolImages.objects.filter(school=school_id).all()
			serializer = SchoolImagesSerializer(queryset, many=True)
			return Response(serializer.data)
	
	def add(self, request, school_id=None):
		if request.method == 'POST':
			serializer = SchoolImagesSerializer(data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data)
			return Response(serializer.errors)


			