FROM caddy:2.1.1-alpine

COPY index.html /usr/share/caddy/index.html
COPY cat.jpg /usr/share/caddy/cat.jpg
COPY Caddyfile /etc/caddy/Caddyfile

RUN mkdir /user
RUN echo 'Ksenia Sergeyevna Ezhevikina' > /user/fullname.txt
