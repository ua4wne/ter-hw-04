## Задача 1

1. Возьмите код:
 - из ДЗ к лекции 4,
 - из демо к лекции 4.

2. Проверьте код с помощью tflint и checkov. Вам не нужно инициализировать этот проект.

![hw4](task1/hw4.png)
![demo](task1/demo.png)
![hw-check1](task1/hw-check1.png)
![demo-check1](task1/demo-check1.png)
![demo-check2](task1/demo-check2.png)
![demo-check3](task1/demo-check3.png)
![demo-check4](task1/demo-check4.png)

3. Перечислите, какие типы ошибок обнаружены в проекте (без дублей).

>Ответ: не указаны ограничения по версиям при объявлении провайдеров, объявлены не используемые переменные, в объявлении модулей указаны ссылки на git-репозитории без указания конкретного коммита

## Задача 2

1. Возьмите ваш GitHub-репозиторий с выполненным ДЗ 4 в ветке 'terraform-04' и сделайте из него ветку ['terraform-05'](https://github.com/ua4wne/ter-hw-04/tree/terraform-05).

![branch3](task2/branch5.png)
![checkout](task2/checkout.png)

2. Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.

![service_acc](task2/service_acc.png)
![new_key](task2/new_key.png)
![s3](task2/s3.png)
![s3_acl](task2/s3_acl.png)
![init](task2/init.png)

>Выполним команду terraform apply, видим, что файл terraform.tfstate появился в нашем бакете S3

![tfstate](task2/tfstate.png)

> Настраиваем YDB

![ydb](task2/ydb.png)
![ydb_acl](task2/ydb_acl.png)
![table](task2/table.png)

3. Закоммитьте в ветку 'terraform-05' все изменения.
4. Откройте в проекте terraform console, а в другом окне из этой же директории попробуйте запустить terraform apply.

![reconfig](task2/reconfig.png)
![console](task2/console.png)
![plan](task2/plan.png)

5. Пришлите ответ об ошибке доступа к state.

>Error message: operation error DynamoDB: PutItem, https response error StatusCode: 400, RequestID: bfab7804-4815-43d5-bd7f-1fef87b38c4d, ConditionalCheckFailedException: Condition not satisfied

6. Принудительно разблокируйте state. Пришлите команду и вывод.

>`terraform force-unlock c3fadfce-17bd-c90d-b436-692c7b0a0d1b`

![unlock](task2/unlock.png)

## Задача 3

1. Сделайте в GitHub из ветки ['terraform-05'](https://github.com/ua4wne/ter-hw-04/tree/terraform-05) новую ветку ['terraform-hotfix'](https://github.com/ua4wne/ter-hw-04/tree/terraform-hotfix).

>`git checkout -b terraform-hotfix`

![hotfix](task3/hotfix.png)

2. Проверье код с помощью tflint и checkov, исправьте все предупреждения и ошибки в 'terraform-hotfix', сделайте коммит.

![tflint](task3/tflint.png)

>Исправляем найденные ошибки и снова проверяем код

![check](task3/check.png)
![checkov](task3/checkov.png)

>Как видим - ошибок больше нет! Делаем коммит

3. Откройте новый pull request 'terraform-hotfix' --> 'terraform-05'.
4. Вставьте в комментарий PR результат анализа tflint и checkov, план изменений инфраструктуры из вывода команды terraform plan.
5. Пришлите ссылку на PR для ревью. Вливать код в 'terraform-05' не нужно.

>Ответ: [ссылка](https://github.com/ua4wne/ter-hw-04/pull/1)

## Задача 4

1. Напишите [переменные с валидацией](src/variables.tf) и протестируйте их, заполнив default верными и неверными значениями. Предоставьте скриншоты проверок из terraform console.

- type=string, description="ip-адрес" — проверка, что значение переменной содержит верный IP-адрес с помощью функций cidrhost() или regex(). Тесты: "192.168.0.1" и "1920.1680.0.1";

![one_ip](task4/one_ip.png)
![plan](task4/plan.png)
![bad_one_ip](task4/bad_one_ip.png)
![error_plan](task4/error_plan.png)

- type=list(string), description="список ip-адресов" — проверка, что все адреса верны. Тесты: ["192.168.0.1", "1.1.1.1", "127.0.0.1"] и ["192.168.0.1", "1.1.1.1", "1270.0.0.1"].

![list_ip](task4/list_ip.png)
![plan2](task4/plan2.png)
![bad_list_ip](task4/bad_list_ip.png)
![error_plan2](task4/error_plan2.png)

## Задача 5*

1. Напишите переменные с валидацией:

- type=string, description="любая строка" — проверка, что строка не содержит символов верхнего регистра;

![var](task5/var.png)
![console](task5/console.png)
![bad_var](task5/bad_var.png)
![error](task5/error.png)

- type=object — проверка, что одно из значений равно true, а второе false, т. е. не допускается false false и true true:

![map](task5/map.png)
![console](task5/map_console.png)
![bad_map](task5/bad_map.png)
![error](task5/bad_map_console.png)

## Задача 6*

## Задача 7*

1. Настройте отдельный terraform root модуль, который будет создавать YDB, s3 bucket для tfstate и сервисный аккаунт с необходимыми правами.
