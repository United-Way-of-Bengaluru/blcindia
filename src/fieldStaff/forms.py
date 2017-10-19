from __future__ import unicode_literals
from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Div, Submit, HTML, Button, Row, Field
from crispy_forms.bootstrap import AppendedText, PrependedText, FormActions
from django.contrib.auth import get_user_model
from aanganwadi.models import school

User = get_user_model()


class schoolForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(schoolForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_tag = False
        self.helper.layout = Layout(
            Field('name'),
            Field('address'),
            Field('type'),
            Field('rural_urban'),
            Field('building_status'),
            Field('worker_name'),
            Field('worker_number'),
            Field('helper_name'),
            Field('helper_number'),
            Field('supervisor_name'),
            Field('supervisor_number'),
            Field('cdpo_name'),
            Field('cdpo_number'),
            Submit('add', 'Add School', css_class="btn-success"),
            )

    class Meta:
        model = school
        fields = ['name', 'address', 'type', 'rural_urban', 'building_status', 'worker_name', 'worker_number', 'helper_name', 'helper_number', 'supervisor_name', 'supervisor_number', 'cdpo_name', 'cdpo_number']

