install:
	docker compose up -d --build php db redis nginx
	docker compose exec php composer update
	docker compose exec php composer install
	docker compose exec php php artisan key:generate
	docker compose exec php php artisan migrate
	docker compose run --rm npm install
	docker compose exec -T php php docker/scripts/generate-reverb-keys.php
	docker compose up -d --build reverb
	docker compose exec php php artisan ziggy:generate
	docker compose run --rm npm run build

composer:
	docker compose exec php composer $(filter-out $@,$(MAKECMDGOALS))

format:
	docker compose exec php composer format

php-tests:
	docker compose exec php php artisan test

php-ide-helper:
	docker compose exec php php artisan ide-helper:generate

php:
	docker compose exec php php $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

stan:
	docker compose exec php ./vendor/bin/phpstan analyse --memory-limit=512M

dev:
	docker compose run --rm --service-ports npm run dev

reverb:
	docker compose exec php php artisan reverb:start

reverb-debug:
	docker compose exec php php artisan reverb:start --debug

ziggy-generate:
	docker compose exec php php artisan ziggy:generate --types
