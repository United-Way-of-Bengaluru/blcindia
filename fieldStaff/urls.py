from __future__ import absolute_import, unicode_literals

from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin

from django.contrib.auth import views as auth_views
from django.views.decorators.csrf import csrf_exempt

from fieldStaff.views import SchoolListView, SchoolUpdateView, SchoolDetailView

urlpatterns = [
    url(r'^$', SchoolListView.as_view(), name='school_list'),
    url(r'^school_detail/(?P<pk>\d+)/$', SchoolDetailView.as_view(), name='school-detail'),
    # url(r'^school_update/(?P<pk>\d+)/$', SchoolUpdateView.as_view(), name='school_update'),

    # url(r'^appointment_detail/(?P<id>[0-9]+)/$', AppointmentFollowupListView.as_view(), name='appointment_detail'),
    # url(r'^dashboard/$', appointment_list.as_view(), name='dashboard'),
    # url(r'^profile/$', appointment_list.as_view(), name='profile'),
    url(r'^accounts/logout/', auth_views.logout, {'next_page': '/'}, name='logout'),



]
