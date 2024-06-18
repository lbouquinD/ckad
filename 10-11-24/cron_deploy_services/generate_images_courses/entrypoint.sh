#!/bin/sh
# Démarrer le serveur Nginx en arrière-plan

sed -i "s/MY_POD_NAME/${MY_POD_NAME}/g" /usr/share/nginx/html/index.html.tpl

sed -i "s/NAME/${NAME}/g" /usr/share/nginx/html/index.html.tpl
cp  /usr/share/nginx/html/index.html.tpl  /usr/share/nginx/html/index.html


nginx -g 'daemon off;'

