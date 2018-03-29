install redis

add env var SECRET_KEY_BASE

config/puma.rb add: bind "unix:///tmp/puma.sock"

install and configure nginx:
```
        upstream puma {
            server unix:///tmp/puma.sock fail_timeout=0;
        }

        server {
            listen 443 ssl;
            server_name 195.133.196.173;

            ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
            ssl_certificate /root/telegram_bot_app/cert.pem;
            ssl_certificate_key /root/telegram_bot_app/private.key;


            # Первый бот
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
