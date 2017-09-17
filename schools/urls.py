from django.conf.urls import url

from schools.views import SchoolsData

urlpatterns = [
    url(r'^$', SchoolsData.as_view({'get': 'list'}), name='schoolData'),
    # url(r'^code/(?P<pk>[A-Za-z0-9]+)$', SchoolsData.as_view({'get': 'retrieve'}), name='SchoolsByCode'),
    url(r'^school/(?P<school_id>[A-Za-z0-9]+)$', SchoolsData.as_view({'get': 'retrieve'}), name='SchoolsByCode'),
    ]