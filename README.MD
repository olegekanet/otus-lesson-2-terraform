Из-за разных моментов как можно сделать и переделать. Я пока пришел к тому последнему варианту на котором решил остановиться. 

## Быстрый старт ##
```
./start.sh
```
## Для остановки ##
```
./stop.sh
```


## Подробности ##
Погнали по командам, чтобы запуститься надо чтобы был настроен yc.

Дальше создали сервисный аккаунт 
```
yc iam service-account create --name otus_service_account
```
проверили его и достали его айди 
```
yc iam service-account list
```
Подставляем айди генерим key.json
```
yc iam key create  --service-account-id <ID>   --output key.json
```

Дальше конфигурируем
```
yc config set service-account-key key.json
yc config set cloud-id <ID клауда>
yc config set folder-id <ID фолдер>
```

Потом экспортируем переменные для работы терраформа 
```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id) 
export YC_FOLDER_ID=$(yc config get folder-id)
```

Дальше чтобы меньше файлов ложить в гит и чтобы все работало с 1 запускаемого файла и чтобы баг который чуть ниже описан, и дальше чтобы виртуалка успела запуститься стоит время в 60 секунд паузы между виртуалкой и ансиблом плейбуком, сделал bash скрипт start.sh 

Согласно бага яндекса и терраформа 

`https://yandex.cloud/ru/docs/troubleshooting/compute/known-issues/permission-denied-error-when-connected-as-user-created-from-terraform-manifest`

Можно конечно еще пострадать и перехерачить чегото, но в целом трохи гдето прокачался, гдето понял что кнопку сделать "Сделать все пи....!" сделать можно, но костылями. 
В дополнение чтобы понимать что Nginx мой и заработал закидываю в него файл index.html чтобы в браузере открывался и показывал. 

Когда все отработает терраформ выдаст instance_ip_address перейда по данному айпи можно наблюдать страницу index.html

###Как то так!

