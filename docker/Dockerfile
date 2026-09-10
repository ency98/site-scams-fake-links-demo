# Dockerfile for the site-scams-encyapps.com Nginx container
FROM nginx:latest
COPY ../site/scams-fake-links /usr/share/nginx/html:ro
EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]