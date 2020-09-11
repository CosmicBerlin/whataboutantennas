install:
	docker-compose exec cms bash -c 'pip3 install -r requirements.txt'

install_nuxt:
	docker-compose run --rm nuxt bash -c 'rm -fr node_modules && yarn install --force'

migrate:
	docker-compose exec cms bash -c 'python3 manage.py makemigrations'
	docker-compose exec cms bash -c 'python3 manage.py migrate'

createsuperuser:
	docker-compose exec cms bash -c "python3 manage.py createsuperuser"

backup:
	docker-compose exec cms bash -c 'python3 manage.py dumpdata --natural-foreign --indent 2 \
    -e contenttypes -e auth.permission \
    -e wagtailcore.groupcollectionpermission \
    -e wagtailcore.grouppagepermission -e wagtailimages.rendition \
    -e sessions -e wagtailcore.site > fixtures.json'

load:
	docker-compose exec cms bash -c 'python3 manage.py loaddata fixtures.json'


deletewagtailimages:
	docker-compose exec cms bash -c 'python3 manage.py delete_all_wagtail_images'


initial: migrate createsuperuser
