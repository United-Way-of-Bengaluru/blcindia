from django.conf.urls import url

from schools.views import SchoolsData,SchoolsByCode

urlpatterns = [
    url(r'^$', SchoolsData.as_view({'get': 'list'}), name='schoolData'),
    #url(r'^code/(?P<code>[A-Za-z0-9]+)$', SchoolsByCode.as_view({'get': 'list'}), name='SchoolsByCode'),
    ]