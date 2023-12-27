# Домашнее задание 9

- Создайте Dockerfile на основе уже существующего образа Jenkins и доработайте его так, чтобы при старте контейнера в нем:
  - были устанавлены все необходимы плагины
  - создан пользователь admin
  - созданы учетные данные для подключения к Nexus
  - создана pipeline задача - переделайте задачу из Дз 8 оставив в ней только шаги по тестированию, сборке и заливке артефакта в Nexus
  - не запускалось стартовое окно. <br>
  Не используйте ansible роль.
- Создайте Dockerfile, который создает docker-образ Nexus с необходимыми пользователями, ролями и репозиторием. Для установки и настройки Nexus можно использовать ansible роль.

&nbsp;
- Создайте файл `docker-compose.yaml`, который:
  - собирает образ Jenkins и поднимет контейнер из собранного образа.
  - пробрасывает порт Jenkins на порт 80 host-системы
  - собирает образ Nexus 3 и поднимет контейнер из собранного образа.
  - пробрасывает порт Nexus на порт 81 host-системы
- Создайте директорию `09-docker-compose` и поместите в нее `docker-compose.yaml` и все файлы, необходимые для сборки докер образов и запуска docker-compose.

# Вопросы к экзамену
- Что такое docker-compose?
- Зачем нужна секция version в docker-compose файле?
- Что означает запись:
  ```yaml
  services: 
    webapp:
      build: ./dir
      image: webapp:tag
  ```
- Как взаимодействуют между собой сервисы, запущенные в docker-compose?
- Зачем нужен healthcheck?
- В чем разница между args и environment?


# Полезные ссылки
- [Docker compose file specification](https://docs.docker.com/compose/compose-file/compose-versioning/)

# Команды docker-compose
- `docker-compose up`
- `docker-compose top`
- `docker-compose images`
- `docker-compose up --no-start`
- `docker-compose help`
- `docker-compose create`
- `docker-compose up --help`
- `docker-compose ps`
- `docker-compose down`
- `docker-compose up -d`
