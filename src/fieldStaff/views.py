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
# from django.views.generic.edit import UpdateView
from blcindia import settings
from aanganwadi.models import school, Address, Type, Demographics, BasicFacilities, LearningEnvironment, SafeEnvironment,  CommunityEngagement
from serializers import AddressSerializer, BasicFacilitiesSerializer
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
			schoolData = school.objects.get(pk=pk)
			kwargs["school_form"] = forms.schoolForm(instance=schoolData)

			try:
				demographicsData = Demographics.objects.get(school=schoolData)
				kwargs["demographics_form"] = forms.demographicsForm(instance=demographicsData)
			except Demographics.DoesNotExist:
				print "Demographics not found"
				kwargs["demographics_form"] = forms.demographicsForm()

			kwargs["basic_facilities_form"] = forms.BasicFacilitiesForm() 


			# try:
			# 	LearningEnvironmentData =LearningEnvironment.objects.filter(school=schoolData).first()
			# 	kwargs["learning_environment_form"] = forms.LearningEnvironmentForm(instance=LearningEnvironmentData)
			# except LearningEnvironment.DoesNotExist:
			# 	print "LearningEnvironment not found"
			# 	kwargs["learning_environment_form"] = forms.LearningEnvironmentForm()

			# try:
			# 	SafeEnvironmentData = SafeEnvironment.objects.filter(school=schoolData).first()
			# 	kwargs["safe_environment_form"] = forms.SafeEnvironmentForm(instance=SafeEnvironmentData)
			# except SafeEnvironment.DoesNotExist:
			# 	print "SafeEnvironment not found"
			# 	kwargs["safe_environment_form"] = forms.SafeEnvironmentForm()

			# try:
			# 	CommunityEngagementData = CommunityEngagement.objects.filter(school=schoolData).first()
			# 	kwargs["community_engagement_form"] = forms.CommunityEngagementForm(instance=CommunityEngagementData)
			# except CommunityEngagement.DoesNotExist:
			# 	print "CommunityEngagement not found"
			# 	kwargs["community_engagement_form"] = forms.CommunityEngagementForm()

		else:
			kwargs["school_form"] = forms.schoolForm()
			kwargs["demographics_form"] = forms.demographicsForm()
			kwargs["basic_facilities_form"] = forms.basic_facilities_form()
			kwargs["learning_environment_form"] = forms.LearningEnvironmentForm()
			kwargs["safe_environment_form"] = forms.SafeEnvironmentForm()
			kwargs["community_engagement_form"] = forms.CommunityEngagementForm()
			
		return super(SchoolperiodicUpdate_View, self).get(request, *args, **kwargs)

	def post(self, request, *args, **kwargs):
		user = self.request.user

		if 'save_school_info' in request.POST:
			if "pk" in kwargs:
				pk = kwargs.get('pk')
				schoolData = school.objects.get(pk=pk)
				school_form = forms.schoolForm(request.POST, instance=schoolData)

				try:
					demographicsData = Demographics.objects.get(school=schoolData)
					demographics_form = forms.demographicsForm(instance=demographicsData)
				except Demographics.DoesNotExist:
					demographics_form = forms.demographicsForm()

				try:
					BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
					basic_facilities_form = forms.BasicFacilitiesForm(instance=BasicFacilitiesData)
				except BasicFacilities.DoesNotExist:
					basic_facilities_form = forms.BasicFacilitiesForm() 

				try:
					LearningEnvironmentData = LearningEnvironment.objects.filter(school=schoolData).first()
					LearningEnvironment_form = forms.LearningEnvironmentForm(instance=LearningEnvironmentData)
				except LearningEnvironment.DoesNotExist:
					LearningEnvironment_form = forms.LearningEnvironmentForm() 

				try:
					SafeEnvironmentData = SafeEnvironment.objects.filter(school=schoolData).first()
					SafeEnvironment_form = forms.SafeEnvironmentForm(rinstance=SafeEnvironmentData)
				except SafeEnvironment.DoesNotExist:
					SafeEnvironment_form = forms.SafeEnvironmentForm() 


				try:
					CommunityEngagementData = CommunityEngagement.objects.filter(school=schoolData).first()
					community_engagement_form = forms.CommunityEngagementForm(instance=CommunityEngagementData)
				except CommunityEngagement.DoesNotExist:
					community_engagement_form = forms.CommunityEngagementForm()

			else:
				school_form = forms.schoolForm(request.POST)  



			if not school_form.is_valid():
				messages.error(request, "There was a problem with the form. "
							   "Please check the details.")
				if "pk" in kwargs:
					pk = kwargs.get('pk')
					schoolData = school.objects.get(pk=pk)
					kwargs["school_form"] = forms.schoolForm(instance=schoolData)

					try:
						demographicsData = Demographics.objects.get(school=schoolData)
						demographics_form = forms.demographicsForm(instance=demographicsData)
					except Demographics.DoesNotExist:
						demographics_form = forms.demographicsForm()

				else:
					kwargs["school_form"] = forms.schoolForm() 
					demographics_form = forms.demographicsForm()           
				return super(SchoolperiodicUpdate_View, self).get(request,
													school_form=school_form, 
													demographics_form = demographics_form,
													basic_facilities_form= basic_facilities_form,
													learning_environment_form=LearningEnvironment_form,
													safe_environment_form=SafeEnvironment_form,
													community_engagement_form=community_engagement_form)
			# Both forms are fine. Time to save!
			school_form.save()
			messages.success(request, "School details saved!")
			return redirect("fieldstaff:school_list")

		if 'save_demographics' in request.POST:
			print 'save_demographics'

			if "pk" in kwargs:
				pk = kwargs.get('pk')
				schoolData = school.objects.get(pk=pk)
				school_form = forms.schoolForm(instance=schoolData)
				try:
					demographicsData = Demographics.objects.get(school=schoolData)
					demographics_form = forms.demographicsForm(request.POST, instance=demographicsData)
				except Demographics.DoesNotExist:
					demographics_form = forms.demographicsForm(request.POST) 

				try:
					BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
					basic_facilities_form = forms.BasicFacilitiesForm(instance=BasicFacilitiesData)
				except BasicFacilities.DoesNotExist:
					basic_facilities_form = forms.BasicFacilitiesForm() 

				try:
					LearningEnvironmentData = LearningEnvironment.objects.filter(school=schoolData).first()
					LearningEnvironment_form = forms.LearningEnvironmentForm(instance=LearningEnvironmentData)
				except LearningEnvironment.DoesNotExist:
					LearningEnvironment_form = forms.LearningEnvironmentForm() 

				try:
					SafeEnvironmentData = SafeEnvironment.objects.filter(school=schoolData).first()
					SafeEnvironment_form = forms.SafeEnvironmentForm(rinstance=SafeEnvironmentData)
				except SafeEnvironment.DoesNotExist:
					SafeEnvironment_form = forms.SafeEnvironmentForm() 


				try:
					CommunityEngagementData = CommunityEngagement.objects.filter(school=schoolData).first()
					community_engagement_form = forms.CommunityEngagementForm(instance=CommunityEngagementData)
				except CommunityEngagement.DoesNotExist:
					community_engagement_form = forms.CommunityEngagementForm()

			else:
				demographics_form = forms.demographicsForm()            

			print demographics_form

			if not demographics_form.is_valid():
				messages.error(request, "There was a problem with the form. "
							   "Please check the details.")				
				return super(SchoolperiodicUpdate_View, self).get(request,
												school_form=school_form, 
												demographics_form = demographics_form,
												basic_facilities_form= basic_facilities_form,
												learning_environment_form=LearningEnvironment_form,
												safe_environment_form=SafeEnvironment_form,
												community_engagement_form=community_engagement_form
												)  

			demographics_form.save()
			messages.success(request, "Demographics details saved!")
			return redirect("fieldstaff:school_list")



		if 'save_basic_facilities' in request.POST:
			print 'save_basic_facilities'

			if "pk" in kwargs:
				pk = kwargs.get('pk')
				schoolData = school.objects.get(pk=pk)
				school_form = forms.schoolForm(instance=schoolData)

				try:
					BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
					basic_facilities_form = forms.BasicFacilitiesForm(request.POST, instance=BasicFacilitiesData)
				except BasicFacilities.DoesNotExist:
					print "request.POST"
					basic_facilities_form = forms.BasicFacilitiesForm(request.POST) 
					print basic_facilities_form

				try:
					demographicsData = Demographics.objects.get(school=schoolData)
					demographics_form = forms.demographicsForm(instance=demographicsData)
				except Demographics.DoesNotExist:
					demographics_form = forms.demographicsForm()

				try:
					LearningEnvironmentData = LearningEnvironment.objects.filter(school=schoolData).first()
					LearningEnvironment_form = forms.LearningEnvironmentForm(instance=LearningEnvironmentData)
				except LearningEnvironment.DoesNotExist:
					LearningEnvironment_form = forms.LearningEnvironmentForm() 

				try:
					SafeEnvironmentData = SafeEnvironment.objects.filter(school=schoolData).first()
					SafeEnvironment_form = forms.SafeEnvironmentForm(rinstance=SafeEnvironmentData)
				except SafeEnvironment.DoesNotExist:
					SafeEnvironment_form = forms.SafeEnvironmentForm() 

				try:
					CommunityEngagementData = CommunityEngagement.objects.filter(school=schoolData).first()
					community_engagement_form = forms.CommunityEngagementForm(instance=CommunityEngagementData)
				except CommunityEngagement.DoesNotExist:
					community_engagement_form = forms.CommunityEngagementForm()				

			else:
				basic_facilities_form = forms.BasicFacilitiesForm()            

			print basic_facilities_form
			if not basic_facilities_form.is_valid():
				messages.error(request, "There was a problem with the form. "
							   "Please check the details.")
				if "pk" in kwargs:
					pk = kwargs.get('pk')
					schoolData = school.objects.get(pk=pk)
					kwargs["school_form"] = forms.BasicFacilitiesForm(instance=schoolData)
					try:
						BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
						kwargs["basic_facilities_form"] = forms.BasicFacilitiesForm(instance=BasicFacilitiesData)
					except BasicFacilities.DoesNotExist:
						kwargs["basic_facilities_form"] = forms.BasicFacilitiesForm() 

					return super(SchoolperiodicUpdate_View, self).get(request,
													school_form=school_form, 
													demographics_form = demographics_form,
													basic_facilities_form= basic_facilities_form,
													learning_environment_form=LearningEnvironment_form,
													safe_environment_form=SafeEnvironment_form,
													community_engagement_form=community_engagement_form
													)  

			basicfacilities_form.save()
			messages.success(request, "BasicFacilities details saved!")
			return redirect("fieldstaff:school_list")


		if 'save_learning_environment' in request.POST:
			print 'save_learning_environment'

			if "pk" in kwargs:
				pk = kwargs.get('pk')
				schoolData = school.objects.get(pk=pk)
				school_form = forms.schoolForm(instance=schoolData)
				try:
					LearningEnvironmentData = LearningEnvironment.objects.filter(school=schoolData).first()
					LearningEnvironment_form = forms.LearningEnvironmentForm(request.POST, instance=LearningEnvironmentData)
				except BasicFacilities.DoesNotExist:
					LearningEnvironment_form = forms.LearningEnvironmentForm(request.POST) 


				try:
					demographicsData = Demographics.objects.get(school=schoolData)
					demographics_form = forms.demographicsForm(instance=demographicsData)
				except Demographics.DoesNotExist:
					demographics_form = forms.demographicsForm()

				try:
					SafeEnvironmentData = SafeEnvironment.objects.filter(school=schoolData).first()
					SafeEnvironment_form = forms.SafeEnvironmentForm(instance=SafeEnvironmentData)
				except SafeEnvironment.DoesNotExist:
					SafeEnvironment_form = forms.SafeEnvironmentForm() 

				try:
					BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
					basic_facilities_form = forms.BasicFacilitiesForm(instance=BasicFacilitiesData)
				except BasicFacilities.DoesNotExist:
					basic_facilities_form = forms.BasicFacilitiesForm()

				try:
					CommunityEngagementData = CommunityEngagement.objects.filter(school=schoolData).first()
					community_engagement_form = forms.CommunityEngagementForm(instance=CommunityEngagementData)
				except CommunityEngagement.DoesNotExist:
					community_engagement_form = forms.CommunityEngagementForm()

			else:
				LearningEnvironment_form = forms.LearningEnvironmentForm()            

			#print basicfacilities_form
			if not LearningEnvironment_form.is_valid():
				messages.error(request, "There was a problem with the form. "
							   "Please check the details.")

				return super(SchoolperiodicUpdate_View, self).get(request,
												school_form=school_form, 
												demographics_form = demographics_form,
												basic_facilities_form= basic_facilities_form,
												learning_environment_form=LearningEnvironment_form,
												safe_environment_form=SafeEnvironment_form,
												community_engagement_form=community_engagement_form
												)  

			LearningEnvironment_form.save()
			messages.success(request, "LearningEnvironment details saved!")
			return redirect("fieldstaff:school_list")


		if 'save_safe_environment' in request.POST:
			print 'save_safe_environment'

			if "pk" in kwargs:
				pk = kwargs.get('pk')
				schoolData = school.objects.get(pk=pk)
				school_form = forms.schoolForm(instance=schoolData)
				try:
					SafeEnvironmentData = SafeEnvironment.objects.filter(school=schoolData).first()
					SafeEnvironment_form = forms.SafeEnvironmentForm(request.POST, instance=SafeEnvironmentData)
				except BasicFacilities.DoesNotExist:
					SafeEnvironment_form = forms.SafeEnvironmentForm(request.POST) 

				try:
					LearningEnvironmentData =LearningEnvironment.objects.filter(school=schoolData).first()
					LearningEnvironment_form = forms.LearningEnvironmentForm(instance=LearningEnvironmentData)
				except BasicFacilities.DoesNotExist:
					LearningEnvironment_form = forms.LearningEnvironmentForm() 


				try:
					BasicFacilitiesData = BasicFacilities.objects.filter(school=schoolData).first()
					basic_facilities_form = forms.BasicFacilitiesForm(instance=BasicFacilitiesData)
				except BasicFacilities.DoesNotExist:
					basic_facilities_form = forms.BasicFacilitiesForm()

				try:
					demographicsData = Demographics.objects.get(school=schoolData)
					demographics_form = forms.demographics_form(instance=demographicsData)
				except Demographics.DoesNotExist:
					demographics_form = forms.demographics_form()

				try:
					CommunityEngagementData = CommunityEngagement.objects.filter(school=schoolData).first()
					community_engagement_form = forms.CommunityEngagementForm(instance=CommunityEngagementData)
				except CommunityEngagement.DoesNotExist:
					community_engagement_form = forms.CommunityEngagementForm()

			else:
				SafeEnvironment_form = forms.SafeEnvironmentForm()            

			#print basicfacilities_form
			if not SafeEnvironment_form.is_valid():
				messages.error(request, "There was a problem with the form. "
							   "Please check the details.")
				if "pk" in kwargs:
					pk = kwargs.get('pk')
					schoolData = school.objects.get(pk=pk)
					kwargs["school_form"] = forms.SafeEnvironmentForm(instance=schoolData)
					try:
						SafeEnvironmentData = SafeEnvironment.objects.filter(school=schoolData).first()
						kwargs["SafeEnvironment_form"] = forms.SafeEnvironmentForm(instance=SafeEnvironmentData)
					except LearningEnvironment.DoesNotExist:
						kwargs["SafeEnvironment_form"] = forms.SafeEnvironmentForm() 
					return super(SchoolperiodicUpdate_View, self).get(request,
													school_form=school_form, 
													demographics_form = demographics_form,
													basicfacilities_form= basicfacilities_form,
													learning_environment_form=LearningEnvironment_form,
													safe_environment_form=SafeEnvironment_form,
													community_engagement_form=community_engagement_form
													)  

			LearningEnvironment_form.save()
			messages.success(request, "LearningEnvironment details saved!")
			return redirect("fieldstaff:school_list")



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

	def list(self, request):
		if request.method == 'GET':
			queryset = BasicFacilities.objects.filter(school=2).all()
			serializer = BasicFacilitiesSerializer(queryset, many=True)
			return Response(serializer.data)
	
	def add(self, request):
		if request.method == 'POST':
			serializer = BasicFacilitiesSerializer(data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data)
			return Response(serializer.errors)