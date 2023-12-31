# -*- coding: utf-8 -*-
#########################################################################
#
# Copyright (C) 2017 OSGeo
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

from geonode.urls import urlpatterns
from django.urls import path
from admin_upload import views
from django.conf.urls import  url

# You can register your own urlpatterns here
# urlpatterns = [
#     url(r'^admin_form_1/',
#         views.admin_form,
#         name='admin_form'),
#  ] + urlpatterns

urlpatterns = [
    url(r'^admin_upload/',
        views.admin_form,
        name='admin_upload'),
    url(r'^check_columns/',
        views.check_columns,
        name='check_columns'),
    url(r'^read_shapefile/',
        views.read_shapefile,
        name='read_shapefile'),
 ] + urlpatterns

