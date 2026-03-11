<div align="center">

# 🐳 Laravel Docker

**Laravel 12 · Vue 3 · TypeScript · Inertia.js · PostgreSQL · Redis · Reverb**

[![Laravel](https://img.shields.io/badge/Laravel-12-FF2D20?logo=laravel&logoColor=white)](https://laravel.com)
[![Vue](https://img.shields.io/badge/Vue-3-4FC08D?logo=vuedotjs&logoColor=white)](https://vuejs.org)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6?logo=typescript&logoColor=white)](https://www.typescriptlang.org)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker&logoColor=white)](https://docs.docker.com/compose)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-4169E1?logo=postgresql&logoColor=white)](https://www.postgresql.org)
[![Redis](https://img.shields.io/badge/Redis-7-DC382D?logo=redis&logoColor=white)](https://redis.io)

**[English](#english)** | **[Русский](#русский)**

</div>

---

<a id="english"></a>

## 🇬🇧 English

### About

A fully dockerized Laravel 12 application with Vue 3 frontend, real-time WebSocket support via Laravel Reverb, and a modern development toolchain.

### Tech Stack

<table>
<tr><td>

**Backend**
- PHP 8.4 + FPM
- Laravel 12
- Sanctum (API auth)
- Ziggy (route sharing)
- Laravel Reverb (WebSockets)
- PostgreSQL 18
- Redis 7

</td><td>

**Frontend**
- Vue 3 + TypeScript
- Inertia.js
- Pinia (state)
- VueUse
- Laravel Echo
- SCSS + Autoprefixer
- Vite 7

</td><td>

**Dev Tools**
- Pest / Vitest (tests)
- PHPStan / Larastan
- PHP-CS-Fixer
- Rector
- Laravel Debugbar
- IDE Helper

</td></tr>
</table>

### Requirements

- [Docker](https://www.docker.com/) & Docker Compose
- [Git](https://git-scm.com/)
- [Make](https://www.gnu.org/software/make/)

### Quick Start

```bash
git clone https://github.com/PetkaKahin/Laravel_docker.git
cd Laravel_docker
cp .env.example .env
make install
```

This will build containers, install dependencies, generate keys (app + Reverb), run migrations, and build the frontend.

### Development

```bash
make dev          # Start Vite dev server with HMR
```

Open in browser:

| Service | URL |
|---|---|
| App | http://localhost:8000 |
| Vite HMR | http://localhost:5173 |
| Reverb WS | ws://localhost:8080 |

### Make Commands

| Command | Description |
|---|---|
| `make install` | Full project setup |
| `make dev` | Vite dev server with HMR |
| `make format` | PHP code formatting (PHP-CS-Fixer) |
| `make stan` | Static analysis (PHPStan) |
| `make php-tests` | Run tests (Pest) |
| `make php-ide-helper` | Generate IDE helpers |
| `make reverb` | Start Reverb server |
| `make reverb-debug` | Start Reverb with debug output |

### Docker Services

| Service | Image | Port |
|---|---|---|
| `php` | PHP 8.4-FPM | 9000 (internal) |
| `nginx` | Nginx 1.29 | **8000** → 80 |
| `db` | PostgreSQL 18 | **5432** |
| `redis` | Redis 7 | **6379** |
| `reverb` | PHP 8.4-FPM | **8080** |
| `npm` | Node LTS | **5173** (dev) |

### Environment Variables

Key variables in `.env.example`:

| Variable | Default | Description |
|---|---|---|
| `APP_WEB_PORT` | `8000` | Application port |
| `APP_VITE_PORT` | `5173` | Vite HMR port |
| `REVERB_PORT` | `8080` | WebSocket server port |
| `DB_HOST` | `db` | PostgreSQL host (container name) |
| `REDIS_HOST` | `redis` | Redis host (container name) |
| `REVERB_HOST` | `reverb` | Reverb host for backend (container name) |
| `REVERB_FRONTEND_HOST` | `localhost` | Reverb host for frontend (browser) |

### Useful Commands

```bash
# Artisan
docker compose exec php php artisan <command>

# Composer
docker compose exec php composer <command>

# npm
docker compose run --rm npm <command>

# PostgreSQL CLI
docker compose exec db psql -U root -d laravel

# Logs
docker compose logs -f <service>

# Shell access
docker compose exec php sh
```

---

<a id="русский"></a>

## 🇷🇺 Русский

### О проекте

Полностью контейнеризированное Laravel 12 приложение с Vue 3 фронтендом, WebSocket поддержкой через Laravel Reverb и современным набором инструментов разработки.

### Стек технологий

<table>
<tr><td>

**Backend**
- PHP 8.4 + FPM
- Laravel 12
- Sanctum (API-аутентификация)
- Ziggy (маршруты на фронте)
- Laravel Reverb (WebSockets)
- PostgreSQL 18
- Redis 7

</td><td>

**Frontend**
- Vue 3 + TypeScript
- Inertia.js
- Pinia (стейт)
- VueUse
- Laravel Echo
- SCSS + Autoprefixer
- Vite 7

</td><td>

**Инструменты**
- Pest / Vitest (тесты)
- PHPStan / Larastan
- PHP-CS-Fixer
- Rector
- Laravel Debugbar
- IDE Helper

</td></tr>
</table>

### Требования

- [Docker](https://www.docker.com/) и Docker Compose
- [Git](https://git-scm.com/)
- [Make](https://www.gnu.org/software/make/)

### Быстрый старт

```bash
git clone https://github.com/PetkaKahin/Laravel_docker.git
cd Laravel_docker
cp .env.example .env
make install
```

Команда соберёт контейнеры, установит зависимости, сгенерирует ключи (приложения + Reverb), выполнит миграции и соберёт фронтенд.

### Разработка

```bash
make dev          # Запуск Vite dev-сервера с HMR
```

Открыть в браузере:

| Сервис | URL |
|---|---|
| Приложение | http://localhost:8000 |
| Vite HMR | http://localhost:5173 |
| Reverb WS | ws://localhost:8080 |

### Make-команды

| Команда | Описание |
|---|---|
| `make install` | Полная установка проекта |
| `make dev` | Vite dev-сервер с HMR |
| `make format` | Форматирование PHP-кода (PHP-CS-Fixer) |
| `make stan` | Статический анализ (PHPStan) |
| `make php-tests` | Запуск тестов (Pest) |
| `make php-ide-helper` | Генерация IDE-хелперов |
| `make reverb` | Запуск Reverb-сервера |
| `make reverb-debug` | Запуск Reverb с отладкой |

### Docker-сервисы

| Сервис | Образ | Порт |
|---|---|---|
| `php` | PHP 8.4-FPM | 9000 (внутренний) |
| `nginx` | Nginx 1.29 | **8000** → 80 |
| `db` | PostgreSQL 18 | **5432** |
| `redis` | Redis 7 | **6379** |
| `reverb` | PHP 8.4-FPM | **8080** |
| `npm` | Node LTS | **5173** (dev) |

### Переменные окружения

Основные переменные в `.env.example`:

| Переменная | Значение | Описание |
|---|---|---|
| `APP_WEB_PORT` | `8000` | Порт приложения |
| `APP_VITE_PORT` | `5173` | Порт Vite HMR |
| `REVERB_PORT` | `8080` | Порт WebSocket-сервера |
| `DB_HOST` | `db` | Хост PostgreSQL (имя контейнера) |
| `REDIS_HOST` | `redis` | Хост Redis (имя контейнера) |
| `REVERB_HOST` | `reverb` | Хост Reverb для бэкенда (имя контейнера) |
| `REVERB_FRONTEND_HOST` | `localhost` | Хост Reverb для фронтенда (браузер) |

### Полезные команды

```bash
# Artisan
docker compose exec php php artisan <command>

# Composer
docker compose exec php composer <command>

# npm
docker compose run --rm npm <command>

# PostgreSQL CLI
docker compose exec db psql -U root -d laravel

# Логи
docker compose logs -f <service>

# Shell-доступ
docker compose exec php sh
```