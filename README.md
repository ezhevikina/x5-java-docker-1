## Практика

Необходимо сделать свой первый статический прокси сервер (такой сервер, который будет раздавать статические файлы наружу клиентам).


Требования для реализации:
1. Необходимо использовать базовый образ https://hub.docker.com/_/caddy
2. Файлы для раздачи необходимо монтировать в `/usr/share/caddy` в качестве volume
3. По-умолчанию там должен лежать только `index.html` с фотографией котика, которая должна лежать рядом
4. Сделайте свой собственный `Caddyfile`, который намертво будет монтироваться в образ в нужную директорию
5. Сделайте возможным работу директивы `file_server browse` в `Caddyfile` https://caddyserver.com/docs/caddyfile/directives/file_server
6. Создайте файл `/user/fullname.txt` со своим полным именем внутри

Формат сдачи:
1. Создайте новый репозиторий docker-1 в персональном пространстве в scm.x5.ru и загрузите в него всё файлы, необходимые для сборки Docker образа.
2. В файле readme.md опишите последовательность команд, которые Вы запускали во время выполнения задания и напишите как запустить ваш образ, чтобы выполнить проверку.

Задание со *
3. Запушьте свой образ в DockerHub. Имя должно быть `<docker account>/x-training-${YOUR_SURNAME}`

p.s. если вы делаете задания в VDI или на выделеной машине в ДинИнфре вам нужно указывать в инструкции FROM docker-registry.x5.ru/caddy


## Последовательность решения

- Разместить cat.jpg и index.html с котом в корне проекта
- Там же создать Dockerfile, в котором используется базовый образ Caddy. Т.к. в Dockerfile образа Caddy уже создавались директории /usr/share/caddy и /etc/caddy, не нужно создавать их в текущем Dockerfile.
- Скопировать содержимое Caddyfile базового образа и добавить file_server browse. Положить Caddyfile в корень проекта
- При сборке образа, в него пройзойдет копирование cat.jpg, index.html и Caddyfile
- При запуске контейнера будет создана директория /user и в ней создастся файл fullname.txt с указанным в Dockerfile содержимым
- Сделать 
		docker build . -t ezhevikina/x-training-ezhevikina
- Запушить образ на dockerhub

## Запуск образа

- git clone git@scm.x5.ru:techschool/202008/personal/Kseniya.Ezhevikina/docker-1.git
- cd docker-1
- sh runimage.sh
- ls /usr/share/caddy
- cat /user/fullname.txt
- Откройте в браузере http://localhost:8000
- Откройте в браузере http://localhost:8000/cat.jpg
- Узрите кота
- exit
