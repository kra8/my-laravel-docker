up:
	docker-compose up -d

down:
	docker-compose down

clean:
	rm -rf ./logs/*.log
	rm -rf ./src/vendor ./src/node_modules .phpunit.result.cache

create:
	docker-compose up -d --build
	docker-compose exec app composer create-project --prefer-dist laravel/laravel ./

init:
	docker-compose down --rmi all --volumes
	docker-compose up -d --build
	docker-compose exec app composer install
	docker-compose exec app cp .env.example .env
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan migrate:fresh

install:
	docker-compose exec app composer install
	docker-compose exec app cp .env.example .env
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan migrate:fresh

destroy:
	docker-compose down --rmi all --volumes
	rm -rf ./logs/*.log
	rm -rf ./src/.env ./src/vendor ./src/node_modules .phpunit.result.cache

ash:
	docker-compose exec app ash -l

tinker:
	docker-compose exec app php artisan tinker
