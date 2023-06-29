# Keep track of files changed
- Updated geonode/geonode/templates/account/signup.html
- Updated geonode/geonode/people/forms.py
- Updated geonode/geonode/people/models.py
- Updated geonode/geonode/settings.py added `ACCOUNT_FORMS = {'signup': 'geonode.people.forms.CustomSignupFormWoolpert'}` at bottom

Run `python manage.py makemigrations` for two added columns to model Profile.
<br />
Good chance of having to run `pip install django-countries`
