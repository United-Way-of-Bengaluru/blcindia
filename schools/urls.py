from django.conf.urls import url

from schools.views import SchoolsData, SchoolsDataDemographics, SchoolsDataInfrastructure

urlpatterns = [
    url(r'^schools//list$', SchoolsData.as_view({'get': 'list'}), name='schoolData'),
    url(r'^boundary/admin1s$', SchoolsData.as_view({'get': 'list'}), name='schoolBoundryData'),
    url(r'^boundary/admin2s$', SchoolsData.as_view({'get': 'list'}), name='schoolBoundryData'),
    url(r'^boundary/admin3s$', SchoolsData.as_view({'get': 'list'}), name='schoolBoundryData'),
    # url(r'^code/(?P<pk>[A-Za-z0-9]+)$', SchoolsData.as_view({'get': 'retrieve'}), name='SchoolsByCode'),
    url(r'^schools/school/(?P<school_id>[A-Za-z0-9]+)$', SchoolsData.as_view({'get': 'retrieve'}), name='SchoolsByCode'),
    url(r'^schools/school/(?P<school_id>[A-Za-z0-9]+)/demographics$', SchoolsDataDemographics.as_view({'get': 'retrieve'}), name='SchoolsDemographics'),
    url(r'^schools/school/(?P<school_id>[A-Za-z0-9]+)/infrastructure$', SchoolsDataInfrastructure.as_view({'get': 'retrieve'}), name='SchoolsInfrastructure'),
    ]