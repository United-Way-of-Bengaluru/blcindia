from rest_framework import serializers

from schools.models import school


class schoolSerializer(serializers.ModelSerializer):
    class Meta:
        model = school
        fields = '__all__'