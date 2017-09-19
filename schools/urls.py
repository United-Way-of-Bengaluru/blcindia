from django.conf.urls import url

from schools.views import SchoolsData, SchoolsDataDemographics, SchoolsDataInfrastructure

urlpatterns = [
    url(r'^list$', SchoolsData.as_view({'get': 'list'}), name='schoolData'),
    # url(r'^code/(?P<pk>[A-Za-z0-9]+)$', SchoolsData.as_view({'get': 'retrieve'}), name='SchoolsByCode'),
    url(r'^school/(?P<school_id>[A-Za-z0-9]+)$', SchoolsData.as_view({'get': 'retrieve'}), name='SchoolsByCode'),
    url(r'^school/(?P<school_id>[A-Za-z0-9]+)/demographics$', SchoolsDataDemographics.as_view({'get': 'retrieve'}), name='SchoolsDemographics'),
    url(r'^school/(?P<school_id>[A-Za-z0-9]+)/infrastructure$', SchoolsDataInfrastructure.as_view({'get': 'retrieve'}), name='SchoolsInfrastructure'),
    ]