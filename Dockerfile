# pull official base image
FROM python:3.11.2-slim-buster

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#         gcc \
#         libpq-dev \
#         postgresql-client

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt
RUN playwright install

# copy project
COPY . .