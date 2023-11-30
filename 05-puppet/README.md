# Домашнее задание 3

- В репозитории `devops-hometasks` создайте директорию `03-puppet`
- В созданной директории создайте Vagrantfile, создающий 3 виртуальные машины, основанные на Centos:
  - master.puppet - сервер Puppet
	  - Должен быть установлен сервер Puppet
	  - Должен быть установлен r10k. Его следует настроить на использование вашего puppet-репозитория.
  -	slave1.puppet, slave2.puppet
	  - Должен быть установлен puppet-agent. Настройте его на master.puppet.
- Все настройки виртуальных машин должны быть реализованы с помощью ansible.
- Все настройки должны быть описаны в одном playbook, разделение действий по машинам должно происходить через inventory. (С помощью ansible настраивается необходимый минимум для запуска puppet)

- С помощью Puppet настройте сервер slave1.puppet для отображения **[static](files/index.html)** сайта
- С помощью Puppet настройте сервер slave2.puppet для отображения **[dynamic](files/index.php)** сайта

# Вопросы к экзамену
- Что такое Puppet?
- В чем глобальное отличие Puppet от Ansible (кроме языыка, на котором написаны конфиги)?
- Что означает запись `File['/etc/ntp.conf'] ~> Service['ntpd']` ?
- Что будет сделано в результате выполнения следующих строк кода:
  ```bash
  node default{
    file { 'file1':
      path => '/root/README.md',
      ensure => absent,
    }
  }
  ```
- Что такое r10k?
- Какой environment  Pupept использует по умолчанию?

# Конфиг утилиты r10k
```yaml
:cachedir: '/var/cache/r10k'

:sources:
  :my-org:
    remote: 'https://github.com/Fenikks/puppet-master-repo.git'
    basedir: '/etc/puppetlabs/code/environments'
```

# Полезные ссылки

- [Инструкция по установке Puppet](https://puppet.com/docs/puppet/7/server/install_from_packages.html#install-puppet-server-from-packages)
- [Зависимости между объектами](https://puppet.com/docs/puppet/7/lang_relationships.html)
- [Metaparameters](https://www.puppet.com/docs/puppet/7/metaparameter.html)
 
# Команды puppet
- `sudo /opt/puppetlabs/puppet/bin/puppet agent -t`
- `puppetserver ca list --all`
- `puppetserver ca sign --certname slave1.puppet`
- `puppet config print`
- `puppet config print modulepath --section server --environment test`
- `r10k deploy environment -p`
- `puppet resource service mysql`
- `puppet parser validate site.pp`
- `facter processors`

# Пути puppet
- `/opt/puppetlabs/bin`
- `/opt/puppetlabs/puppet/bin`
- `/etc/sysconfig/puppetserver`
- `/etc/puppetlabs/puppet/puppet.conf`
- `/etc/puppetlabs/code/environments`
