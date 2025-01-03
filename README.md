## Задача 1

1. Возьмите из демонстрации к лекции готовый код для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности.

![label1](task1/label1.png)
![label2](task1/label2.png)

В файле [cloud-init.yml](./src/cloud-init.yml) необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} . 

![tempvars](task1/tempvars.png)

2. Добавьте в файл [cloud-init.yml](./src/cloud-init.yml) установку nginx.

![packages](task1/packages.png)

3. Предоставьте скриншот подключения к консоли и вывод команды sudo nginx -t

![nginx](task1/nginx.png)

скриншот консоли ВМ yandex cloud с их метками.

![vm1](task1/vm1.png)
![vm2](task1/vm2.png)

 Откройте terraform console и предоставьте скриншот содержимого модуля.

 ![console](task1/console.png)

## Задача 2

1. Напишите локальный модуль [vpc](./src/vpc/main.tf), который будет создавать 2 ресурса: одну сеть и одну подсеть в зоне, объявленной при вызове модуля, например: ru-central1-a.

![module](task2/module.png)

2. Вы должны передать в модуль [переменные](./src/vpc/variables.tf) с названием сети, zone и v4_cidr_blocks.

![vars](task2/vars.png)

3. Модуль должен возвращать в root module с помощью [output](./src/vpc/output.tf) информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле.

![console](task2/console.png)

4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.

![res1](task2/res1.png)
![res2](task2/res2.png)

5. Сгенерируйте документацию к модулю с помощью terraform-docs.

>Ответ: [документацию](./src/vpc/README.md) получил с помощью команды `docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.19.0 markdown /terraform-docs > README.md`


## Задача 3

1. Выведите список ресурсов в стейте.

![state](task3/state.png)

2. Полностью удалите из стейта модуль vpc.

![rm_vpc](task3/rm_vpc.png)

3. Полностью удалите из стейта модуль vm.

![rm_vm](task3/rm_vm.png)

4. Импортируйте всё обратно. Проверьте terraform plan. Значимых(!!) изменений быть не должно. Приложите список выполненных команд и скриншоты процессов.

![import_vpc](task3/import_vpc.png)
![import_sub](task3/import_sub.png)
![import_vm](task3/import_vm.png)
![plan](task3/plan.png)

## Задача 4*

1. Измените модуль [vpc](./src/vpc/main.tf) так, чтобы он мог создать подсети во всех зонах доступности, переданных в переменной типа list(object) при вызове модуля.

![vpc_prod](task4/vpc_prod.png)
![apply](task4/apply.png)
![result](task4/result.png)

## Задача 5*

1. Напишите модуль для создания кластера managed БД Mysql в Yandex Cloud с одним или несколькими(2 по умолчанию) хостами в зависимости от переменной HA=true или HA=false. Используйте ресурс yandex_mdb_mysql_cluster: передайте имя кластера и id сети.

>Ответ: модуль [mysql_cluster](./task5/mysql_cluster/)

2. Напишите модуль для создания базы данных и пользователя в уже существующем кластере managed БД Mysql. Используйте ресурсы yandex_mdb_mysql_database и yandex_mdb_mysql_user: передайте имя базы данных, имя пользователя и id кластера при вызове модуля.

>Ответ: модуль [mysql_db](./task5/mysql_db/)

3. Используя оба модуля, создайте кластер example из одного хоста, а затем добавьте в него БД test и пользователя app. Затем измените переменную и превратите сингл хост в кластер из 2-х серверов.

>Ответ: [main.tf](./task5/main.tf)

4. Предоставьте план выполнения и по возможности результат. Сразу же удаляйте созданные ресурсы, так как кластер может стоить очень дорого. Используйте минимальную конфигурацию.

![plan1](task5/plan1.png)
![cluster1](task5/cluster1.png)
![db](task5/db.png)

![one host](task5/false_ha.png)
![host1](task5/host1.png)

![two host](task5/true_ha.png)
![plan2](task5/plan2.png)
![host2](task5/host2.png)

## Задача 6*

1. Используя готовый yandex cloud terraform module и пример его вызова(examples/simple-bucket): https://github.com/terraform-yc-modules/terraform-yc-s3 . Создайте и не удаляйте для себя s3 бакет размером 1 ГБ(это бесплатно), он пригодится вам в ДЗ к 5 лекции.

>Ответ: [решение](./task6/)

![apply](task6/apply.png)
![backet](task6/backet.png)

## Задача 7*

1. Разверните у себя локально vault, используя [docker-compose.yml](./task7/docker-compose.yml) в проекте.

2. Для входа в web-интерфейс и авторизации terraform в vault используйте токен "education".

![login](task7/login.png)

3. Создайте новый секрет по пути http://127.0.0.1:8200/ui/vault/secrets/secret/create Path: example secret data key: test secret data value: congrats!

![secret](task7/secret.png)

4. Считайте этот секрет с помощью terraform и выведите его в output.

>Ответ [main.tf](./task7/main.tf)

![read](task7/read.png)

5. Попробуйте самостоятельно разобраться в документации и записать новый секрет в vault с помощью terraform.

>Ответ [main.tf](./task7/main.tf)

![apply](task7/apply.png)
![secrets](task7/secrets.png)
![new](task7/new.png)
