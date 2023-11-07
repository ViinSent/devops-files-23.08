# Автоматизация установки

- [groovy скрипты](auto/scripts/02-admin-user.groovy) в директории `/var/lib/jenkins/init.groovy.d` (Скрипты выполняются по очереди. Номер в имени определяет порядок.)
- плагин Configuration as code<br>
для использования плагина нужно в переменную CASC_JENKINS_CONFIG поместить путь к файлам конфигурации <br>
```bash
export CASC_JENKINS_CONFIG=/var/lib/jenkins/casc_configs
```
либо добавить параметр `-Dcasc.jenkins.config=${JENKINS_HOME}/casc_configs` в `JAVA_ARGS` systemd сервиса Jenkins.

лобо в JENKINS_HOME создать файл jenkins.yaml с конфигурацией

Пример конфигурации для плагина Configuration as code:

```yml
unclassified:
  locale:
    systemLocale: en
    ignoreAcceptLanguage: true

credentials:
  system:
    domainCredentials:
    - credentials:
      - usernamePassword:
          scope:    GLOBAL
          id:       slave_creds
          username: vagrant
          password: vagrant

tool:
  go:
    installations:
    - name: "go_lang"
      properties:
      - installSource:
          installers:
          - golangInstaller:
              id: "1.16"
```


# Скрипт для сборки проекта

```bash
sed -i "s/1.DEVELOPMENT/1.$BUILD_NUMBER/g" static/version

GOOS=linux GOARCH=amd64 go build -o ./artifacts/word-cloud-generator -v 

md5sum artifacts/word-cloud-generator
gzip artifacts/word-cloud-generator
ls -l artifacts/
```

# Домашнее задание 5

- В репозитории `devops-hometasks` создайте директорию `05-jenkins`
- C помощью Vagrant создайте виртуальную машину `jenkins.vm` основанную на Debian
- Напишите свою роль для установки Jenkins. Роль должна содержать:
  - Конфигурацию системы
  - Установку и настройку необходимых плагинов
  - Создание задачи
  - Создание необходимых credentials
- Для примера можно использовать роли [ansible-jenkins](https://github.com/emmetog/ansible-jenkins), [ansible-role-jenkins](https://github.com/geerlingguy/ansible-role-jenkins)
- На машине jenkins.vm установите Jenkins с помощью вашей ansible роли. 

# Вопросы к экзамену
- Что такое Jenkins?
- Для чего нужны slave?
- Какие задачи можно выполнять с помощью Jenkins?
- Что необходимо, чтобы собрать проект на каком-либо языке приложения (go, java и т.д.), или например использовать для сборки такие приложения как ant, maven?
- Назовите минимум 3 способа запуска задания в Jenkins
- Где Jenkins сохраняет все файлы, которые используются при выполнении задачи?

# Полезные ссылки

- [Установка Jenkins](https://jenkins.io/doc/book/installing/)

- [Configuration as code](https://plugins.jenkins.io/configuration-as-code/)
- [Configuration as code примеры](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/demos/README.adoc)
- [Init scripts](https://github.com/roboshop-jenkins/jenkins/tree/master/init-scripts)

- [Настройка агентов Jenkins](https://kamaok.org.ua/?p=2929)
- [Репозиторий приложения](https://github.com/wickett/word-cloud-generator)
- [Библиотека ролей для ansible](https://galaxy.ansible.com)
- [Роль для настройки jenkins](https://github.com/emmetog/ansible-jenkins)
  
- [Описание Core API](https://wiki.jenkins.io/display/JENKINS/Remote+access+API)
- [REST-API для плагина Credentials](https://support.cloudbees.com/hc/en-us/articles/360030526992-How-to-manage-Credentials-via-the-REST-API)
- [Красивый вывод Jenkins REST-API](http://automation-remarks.com/kak-prruchit-jenkins-api/)
- [Python API](https://jenkinsapi.readthedocs.io/en/latest/using_jenkinsapi.html)
- [Установка плагинов через API](https://www.anycodings.com/1questions/1072214/how-to-install-plugins-in-jenkins-with-the-help-of-jenkins-remote-access-api)
