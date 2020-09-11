FROM python:3.8.1-slim-buster
LABEL maintainer="sarah@cosmic.berlin"

ENV PYTHONUNBUFFERED 1

# Install system packages required by Wagtail and Django.
RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    build-essential \
    libpq-dev \
    libmariadbclient-dev \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libwebp-dev \
 && rm -rf /var/lib/apt/lists/*

# Install the application server.
RUN pip3 install --upgrade pip

# Install the project requirements.
COPY requirements.txt /
RUN pip3 install -r /requirements.txt
RUN pip3 install psycopg2 gunicorn

# Use /app folder as a directory where the source code is stored.
COPY ./ /cms
WORKDIR /cms

COPY ./entrypoint.sh /usr/local/bin

RUN useradd wagtail
RUN chown -R wagtail /cms
USER wagtail

CMD ["/usr/local/bin/entrypoint.sh"]
