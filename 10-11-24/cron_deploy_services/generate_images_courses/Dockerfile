# Utilisez une image Nginx légère basée sur Alpine
FROM nginx:latest

# Copiez le fichier de configuration Nginx personnalisé dans le conteneur
COPY nginx.conf /etc/nginx/nginx.conf

# Copiez le script d'entrée dans le conteneur
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Donnez les autorisations d'exécution au script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Copiez le fichier HTML avec le message personnalisé
#COPY index.html /usr/share/nginx/html/index.html
COPY index.html.tpl /usr/share/nginx/html/index.html.tpl

# Commande par défaut pour exécuter le script
CMD ["/usr/local/bin/entrypoint.sh"]

