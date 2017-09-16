"""blcindia URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from views import StaticPageView
from django.views.generic.base import RedirectView
from schools.views import AdvancedMapView


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^schools-api/', include('schools.urls')),
    # home page
    url(r'^$', StaticPageView.as_view(
        template_name='home.html',
    ), name='home'),

url(r'^status/$', StaticPageView.as_view(
        template_name='comingsoon.html'
    ), name='status'),

    # mobile responses
    url(r'^mobile/$', StaticPageView.as_view(
        template_name='survey_responses.html'
    ), name='mobile'),

    # story dashboard
    url(r'^stories/$', StaticPageView.as_view(
        template_name='story_dashboard.html'
    ), name='story_dashboard'),

    # gka ivrs
    url(r'^gka/$', StaticPageView.as_view(
        template_name='gka_dashboard.html'
        ), name='gka_dashboard'),

    # styleguide page
    url(r'^styleguide/$', StaticPageView.as_view(
        template_name='styleguide.html'
    ), name='styleguide'),

    # about pages
    url(r'^about/$', StaticPageView.as_view(
        template_name='aboutus.html',
    ), name='aboutus'),
    url(r'text/aboutus/$', RedirectView.as_view(url='/about')),

    url(r'^partners/$', StaticPageView.as_view(
        template_name='partners.html',
    ), name='partners'),
    url(r'text/partners/$', RedirectView.as_view(url='/partners')),

    url(r'^disclaimer/$', StaticPageView.as_view(
        template_name='disclaimer.html',
    ), name='disclaimer'),
    url(r'text/disclaimer/$', RedirectView.as_view(url='/disclaimer')),

    # reports page
    url(r'^reports/$', StaticPageView.as_view(
        template_name='reports.html',
    ), name='reports'),
    url(r'text/reports/$', RedirectView.as_view(url='/reports')),

    # temporary klp reports page to link to static pdfs
    url(r'^reports/klp/$', StaticPageView.as_view(
        template_name='klpreports.html',
    ), name='klpreports'),

    # temporary dise reports page to link to static pdfs
    url(r'^reports/dise/$', StaticPageView.as_view(
        template_name='disereports.html',
    ), name='disereports'),

    # data page
    url(r'^data/$', StaticPageView.as_view(
        template_name='data.html',
    ), name='data'),

    url(r'^map/$', StaticPageView.as_view(
        template_name='map.html',
        extra_context={
            'hide_footer': True,
        }), name='map'),

    url(r'^advanced-map/$', AdvancedMapView.as_view(), name='advanced_map'),

    # report pages
    url(r'^reports/search$', StaticPageView.as_view(
        template_name='report_search.html'
        ), name='report_search'),

    url(r'^reports/demographics/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='demographics.html'
        ), name='demographics'),

    url(r'^reports/demographics_dise/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='demographics_dise.html'
        ), name='demographics_dise'),

    url(r'^reports/finance/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='finance.html'
        ), name='finance'),

    url(r'^reports/infrastructure/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='infrastructure.html'
        ), name='infrastructure'),

    url(r'^reports/surveys$', StaticPageView.as_view(
        template_name='story_report.html'
        ), name='stories'),

    url(r'^volunteer/$', StaticPageView.as_view(
        template_name='volunteer.html',
    ), name='volunteer'),
    url(r'text/volunteer/$', RedirectView.as_view(url='/volunteer/')),

]
