#########################################################################
#
# Copyright (C) 2016 OSGeo
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#########################################################################

import taggit

from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.utils.translation import ugettext as _
from allauth.account.forms import SignupForm
from django_countries.fields import CountryField
# Ported in from django-registration
attrs_dict = {"class": "required"}

class CustomSignupFormWoolpert(SignupForm):

    email = forms.EmailField(required=True)
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    organization = forms.CharField(required=True)
    position = forms.CharField(required=True)
    city = forms.CharField(required=True)
    area = forms.CharField(required=True)
    country = CountryField().formfield()
    reason_joining = forms.CharField(widget=forms.Textarea)
    organization_type = forms.CharField()
    username = forms.CharField(required=True)

    def custom_signup(self, request, user):
        user.username = self.cleaned_data["username"]
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        user.email = self.cleaned_data["email"]
        user.organization = self.cleaned_data["organization"]
        user.position = self.cleaned_data["position"]
        user.city = self.cleaned_data["city"]
        user.area = self.cleaned_data["area"]
        user.country = self.cleaned_data["country"]
        user.profile = self.cleaned_data["reason_joining"]
        user.organization_type = self.cleaned_data["organization_type"]
        user.save()

