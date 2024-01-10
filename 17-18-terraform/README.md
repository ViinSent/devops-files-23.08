# Домашнее задание 13

- Перепишите конфигурацию из 11-го задания на Terraform, используя провайдер Kubernetes
- Все значения - порты, количество реплик, имя контейнера, докер образа и т.д. задайте через переменные
- Используйте backend Kubernetes для сохранения Terraform state
- Сохраните конфигурацию в github в каталоге `13-terraform` используя Terraform провайдер github

# Вопросы к экзамену
- Что такое terraform?
- Зачем нужны провайдеры в terraform?
- Что такое terraform state?
- Для чего используется datasource?
- Что такое output?
- Что означает запись:
  ```terraform
  resource "github_repository_file" "file" { 
      repository = github_repository.tf-mod.name
      ...
  } 
  ```
  ?

# Полезные ссылки

- [Документация Terraform](https://www.terraform.io/docs)
- [Terraform провайдеры](https://registry.terraform.io/browse/providers)
- [Скачать Terraform](https://www.terraform.io/downloads)
- [Terraform CLI configuration](https://developer.hashicorp.com/terraform/cli/config/config-file )