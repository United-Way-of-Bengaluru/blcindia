from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

from views import StaticPageView
from django.views.generic.base import RedirectView
from aanganwadi.views import AdvancedMapView, SchoolPageView, login_success

import profiles.urls
import accounts.urls
from . import views

urlpatterns = [
    #url(r'^$', views.HomePage.as_view(), name='home'),
    url(r'^about/$', views.AboutPage.as_view(), name='about'),
    url(r'^users/', include(profiles.urls, namespace='profiles')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/', include(accounts.urls, namespace='accounts')),
    url(r'^fieldstaff/', include('fieldStaff.urls')),

    url(r'^admin/login_success$', login_success, name='login_success'),
    # url(r'^schools-api/', include('schools.urls')),
    url(r'^api/v1/', include('aanganwadi.urls')),
    url(r'^accounts/', include('accounts.urls')),
    # home page
    url(r'^$', StaticPageView.as_view(
        template_name='front/home.html',
    ), name='home'),

url(r'^status/$', StaticPageView.as_view(
        template_name='front/comingsoon.html'
    ), name='status'),

    # mobile responses
    url(r'^mobile/$', StaticPageView.as_view(
        template_name='front/survey_responses.html'
    ), name='mobile'),

    # story dashboard
    url(r'^stories/$', StaticPageView.as_view(
        template_name='front/story_dashboard.html'
    ), name='story_dashboard'),

    # gka ivrs
    url(r'^gka/$', StaticPageView.as_view(
        template_name='front/gka_dashboard.html'
        ), name='gka_dashboard'),

    # styleguide page
    url(r'^styleguide/$', StaticPageView.as_view(
        template_name='front/styleguide.html'
    ), name='styleguide'),

    # about pages
    url(r'^about/$', StaticPageView.as_view(
        template_name='front/aboutus.html',
    ), name='aboutus'),
    url(r'text/aboutus/$', RedirectView.as_view(url='/about')),

    url(r'^partners/$', StaticPageView.as_view(
        template_name='front/partners.html',
    ), name='partners'),
    url(r'text/partners/$', RedirectView.as_view(url='/partners')),

    url(r'^disclaimer/$', StaticPageView.as_view(
        template_name='front/disclaimer.html',
    ), name='disclaimer'),
    url(r'text/disclaimer/$', RedirectView.as_view(url='/disclaimer')),

    # reports page
    url(r'^reports/$', StaticPageView.as_view(
        template_name='front/reports.html',
    ), name='reports'),
    url(r'text/reports/$', RedirectView.as_view(url='/reports')),

    # temporary klp reports page to link to static pdfs
    url(r'^reports/klp/$', StaticPageView.as_view(
        template_name='front/klpreports.html',
    ), name='klpreports'),

    # temporary dise reports page to link to static pdfs
    url(r'^reports/dise/$', StaticPageView.as_view(
        template_name='front/disereports.html',
    ), name='disereports'),

    # data page
    url(r'^data/$', StaticPageView.as_view(
        template_name='front/data.html',
    ), name='data'),

    url(r'^map/$', StaticPageView.as_view(
        template_name='front/map.html',
        extra_context={
            'hide_footer': True,
        }), name='map'),

    url(r'^advanced-map/$', AdvancedMapView.as_view(), name='advanced_map'),

    # report pages
    url(r'^reports/search$', StaticPageView.as_view(
        template_name='front/report_search.html'
        ), name='report_search'),

    url(r'^reports/demographics/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='front/demographics.html'
        ), name='demographics'),

    url(r'^reports/demographics_dise/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='front/demographics_dise.html'
        ), name='demographics_dise'),

    url(r'^reports/finance/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='front/finance.html'
        ), name='finance'),

    url(r'^reports/infrastructure/(?P<report_type>electedrep|boundary)/(?P<language>english|kannada)/(?P<id>[0-9]+)/$', StaticPageView.as_view(
        template_name='front/infrastructure.html'
        ), name='infrastructure'),

    url(r'^reports/surveys$', StaticPageView.as_view(
        template_name='front/story_report.html'
        ), name='stories'),

    url(r'^volunteer/$', StaticPageView.as_view(
        template_name='front/volunteer.html',
    ), name='volunteer'),
    url(r'text/volunteer/$', RedirectView.as_view(url='/volunteer/')),

    url(r'^school/(?P<pk>[0-9]+)/$',
    SchoolPageView.as_view(), name='school_page'),


]

# User-uploaded files like profile pics need to be served in development
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# Include django debug toolbar if DEBUG is on
if settings.DEBUG:
    import debug_toolbar
    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
