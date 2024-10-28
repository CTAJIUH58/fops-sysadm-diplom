# Курсовая работа на профессии "DevOps-инженер с нуля" Ершов С.В.

### Задача

Ключевая задача — разработать отказоустойчивую инфраструктуру для сайта, включающую мониторинг, сбор логов и резервное копирование основных данных. Инфраструктура должна размещаться в Yandex Cloud.


### Решение

Репозиторий содержит конфигурационные файлы terraform для развёртывания отказоустойчивой инфраструктуры в облаке Яндекс.Клауд 
и плэйбуки ansible для настройки ПО под озувученные задачи.


#### В каталоге terraform находятся:

providers.tf - конфигурация подключения к облачному провайдеру.

resources.tf - конфигурация создаваймой инфраструктуры. Конфигурация поделена на разделы. В конфигурации описаны сети, подсети, группы безопасности, ALB, Cloud router, роутинг, ВМ.

output.tf - описание вывода информации для последующей настройки ПО.


#### В каталоге ansDeploy находятся:


main.yaml - основной плэйбук запускающий настройку инфраструктуры.

WEBdeploy.yaml - плейбук для настройки web серверов. Устанавливает nginx, утсанавливает агенты по сбору метрик, конфигурирует установленный софт.

InstaDockPB.yaml - плейбук инсталирующий докер на виртуальные машины prometheus, elastic, kibana, grafana.

RunElasticPB.yaml - плейбук запускающий настроенный контейнер с elastic.

RunPromPB.yaml - плейбук запускающий настроенный контейнер с prometheus.

RunKibanaPB.yaml - плейбук запускающий настроенный контейнер с Kibana.

RunGrafanaPB.yaml - плейбук запускающий настроенный контейнер с Grafana.


filebeat - директория с шаблонами и установочными файлами для агента filebeat.

NGL - директория с шаблонами и установочными файлами для агента Nginx Log Exporter.

node_exporter - директория с шаблонами и установочными файлами для агента Node Exporter.

prom - директория с шаблонами для конфигурации prometheus.

nginx - директория с шаблонами для конфигурации nginx.


#### Для проверки работы конфигурация развернута на следующих ip адресах:

```

51.250.2.182    Bastion-host используется как jump хост для настройки и доступа к хостам внутри пириметра.
http://51.250.38.70:80    внешний ip адрес Aplication Load Balanser, перенаправляет на один из двух WEB серверов.
http://89.169.142.26:3000   внешний интерфейс Grafana.
http://89.169.157.75:5601    внешний интерфейс Kibana.
192.168.10.19   WEB сервер 1.
192.168.20.17   WEB сервер 2.
192.168.20.28   VM с контейнером elastic.
192.168.30.9    VM с контейнером grafana.
192.168.30.17   VM с контейнером kibana.
192.168.20.3    VM с контейнером prometheus.

```


Логин\пароль для доступа к Grafana - admin\admin.


Закрытый ключ для доступа не сервера приложен к решению.
