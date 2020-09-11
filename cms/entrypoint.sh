#!/bin/bash

function waitForPostgres() {
    echo "Waiting for postgres ..."
    python3 wait_for_postgres.py
}

function migrateTables() {
    echo "Migrating tables..."
    python3 manage.py makemigrations && python3 manage.py migrate --noinput
}

function loadStatics() {
    echo "Loading static files..."
    python3 manage.py collectstatic --noinput
}

function loadFixtures() {
  echo "Loading fixtures..."
  if [ -f fixtures.json ]; then
    python3 manage.py loaddata fixtures.json
  fi
}

function syncPageTranslationFields () {
  echo "Syncing page translation fields..."
  python3 manage.py sync_page_translation_fields
}

waitForPostgres
migrateTables
loadStatics
gunicorn --bind 0.0.0.0:8000 --reload --workers 3 --access-logfile - cms.wsgi:application