## Задача 1

1. Возьмите из демонстрации к лекции готовый код для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности.

![label1](task1/label1.png)
![label2](task1/label2.png)

В файле [cloud-init.yml](./demo1/vms/cloud-init.yml) необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} . 

![tempvars](task1/tempvars.png)

2. Добавьте в файл [cloud-init.yml](./demo1/vms/cloud-init.yml) установку nginx.

![packages](task1/packages.png)

3. Предоставьте скриншот подключения к консоли и вывод команды sudo nginx -t

![nginx](task1/nginx.png)

скриншот консоли ВМ yandex cloud с их метками.

![vm1](task1/vm1.png)
![vm2](task1/vm2.png)

 Откройте terraform console и предоставьте скриншот содержимого модуля.

 ![console](task1/console.png)

## Задача 2