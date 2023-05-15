ARG PYTHON_VERSION=3.11-slim-buster

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt ./requirements.txt

RUN set -ex && \
    pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . /app/

# RUN python manage.py collectstatic --noinput

EXPOSE 8000

# replace demo.wsgi with <project_name>.wsgi
ENTRYPOINT ["./start.sh"] 
