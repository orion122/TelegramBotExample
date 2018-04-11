## Описание
Пользователи пишут в телеграм бот, мы видим эти сообщения на фронте и отвечаем им на эти сообщения.
Слева список контактов. По клику на пользователя справа открывается история переписки и внизу есть поле для ответа. Новые сообщения от пользователей подгружаются по вебсокету с бекенда.
Пользователи могут писать двум ботам: http://t.me/Robo1Bot и http://t.me/Robo6Bot

## Результат
[Ссылка на результат](http://195.133.196.173:3000/)


## Установка, настройка
- config/secrets.yml:
```
development: &dev
 secret_key_base: SECRET_KEY
 telegram:
   bots:
     robo1bot:
       token: TOKEN
       username: bot's username
     robo6bot:
       token: TOKEN
       username: bot's username
       
test:
 secret_key_base: SECRET_KEY
 telegram:
   bots:
     robo1bot:
       token: TOKEN
       username: bot's username
     robo6bot:
       token: TOKEN
       username: bot's username
   
production:
  <<: *dev
```

- добавить в переменные окружения ОС переменную SECRET_KEY_BASE с токеном бота перед настройкой webhook

- настройка webhook: `rake telegram:bot:set_webhook RAILS_ENV=production CERT='cert.pem`

- в config/puma.rb добавить `bind "unix:///tmp/puma.sock"`

- настройка nginx:
```
upstream puma {
    server unix:///tmp/puma.sock fail_timeout=0;
}

server {
    listen 443 ssl;
    server_name SERVER_IP;

    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    ssl_certificate /root/telegram_bot_app/cert.pem;
    ssl_certificate_key /root/telegram_bot_app/private.key;

    location /telegram/ {
        #proxy_pass         http://127.0.0.1:3000/;
        proxy_pass         http://puma;
        proxy_redirect     off;
        proxy_set_header   Host $host;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Host $server_name;
    }

}
```

- установить redis: `sudo apt install redis`

## Тесты
- создание миграций для тестов: ```bin/rake db:migrate RAILS_ENV=test```
- запуск тестов: ```bin/rspec```

## Запуск
```puma -d -C config/puma.rb```