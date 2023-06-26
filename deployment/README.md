# GeoNode Customisations

During the deployment of GeoNode we need to make sure that the following
environmental variables are setup so that we have a strict lockdown policy for 
the GeoNode database

## Database
The database should be provisioned with the following policy:

1) Environmental variables
    ```bash
    FORCE_SSL=TRUE
    
    ```
2) An external database port should be exposed to allow database interactions
from external applications i.e QGIS
    ```bash
    ports:
      - "${DB_PORT}:5432"
    ```
3) Restrict access to the database using IP range. We should not be using the 
default IP range as this is insecure.
    ```bash
    ALLOW_IP_RANGE=0.0.0.0/0
    ```
4) Password policy, When creating users in the DB we should create strong passwords for the users.


## GeoNode

The GeoNode should also be deployed with the following rules set so that it can adhere to the restrictions set out.

1) Configure email backend: The client should provide the following details:
deployment should set the environment variable: `EMAIL_ENABLE = True` while the client should
provide the following variables:
```bash
    "DJANGO_EMAIL_BACKEND"
    "DJANGO_EMAIL_HOST"
    "DJANGO_EMAIL_PORT"
    "DJANGO_EMAIL_HOST_USER"
    "DJANGO_EMAIL_HOST_PASSWORD"
    "DEFAULT_FROM_EMAIL"=info@org.za
```
2) The GeoNode should be available in English and French.

   ```bash
   LANGUAGE_CODE = ("en", "fr", "el")
   ```
   ```bash
   _DEFAULT_LANGUAGES = """(
       ('en', 'English'),
       ('fr', 'Français'),
   )"""
   
   LANGUAGES = ast.literal_eval(os.getenv("LANGUAGES", _DEFAULT_LANGUAGES))
   ```
This can be added to the installation as `local_settings.py`
3) Generic environment variables:
   ```bash
   LOCKDOWN_GEONODE=True
   DEFAULT_ANONYMOUS_VIEW_PERMISSION=False
   DEFAULT_ANONYMOUS_DOWNLOAD_PERMISSION=False
   TIME_ENABLED=True
   API_LOCKDOWN=True
   # https://www.google.com/recaptcha/about/ and https://pypi.org/project/django-recaptcha/#installation
   RECAPTCHA_ENABLED=True
   RECAPTCHA_PUBLIC_KEY=
   RECAPTCHA_PRIVATE_KEY=
   # Default to centre of Africa - makes sense that world
   DEFAULT_MAP_CENTER_X=
   DEFAULT_MAP_CENTER_Y=
   FREETEXT_KEYWORDS_READONLY=
   ADMIN_MODERATE_UPLOADS=True
   GROUP_PRIVATE_RESOURCES=True
   ACCOUNT_APPROVAL_REQUIRED=True
   MONITORING_ENABLED=True
   # Check this
   MONITORING_CONFIG=
   MONITORING_DATA_TTL=30
   USER_ANALYTICS_ENABLED=True
   # We can add the layer to the installation
   GEOIP_PATH=/data/GeoIPCities.dat
   DEFAULT_MAX_UPLOAD_SIZE=200000
   ```
4) 