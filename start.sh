#!/bin/bash 
set -euxo pipefail

python manage.py collectstatic --noinput
python manage.py migrate --noinput
gunicorn --bind :8000 --workers 2 project.wsgi