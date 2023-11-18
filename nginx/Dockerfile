FROM nginx:1.21-alpine

RUN apk update
RUN apk add --no-cache supervisor

# nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY ./etc/conf.d/default.conf /etc/nginx/conf.d

# supervisord
COPY ./etc/supervisord.conf /etc/supervisord.conf
COPY ./etc/supervisor.d /etc/supervisor.d

EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]
CMD ["sh", "-c", "/usr/bin/supervisord -c /etc/supervisord.conf"]
