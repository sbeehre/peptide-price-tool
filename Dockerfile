FROM nginx:alpine

# Copy static application assets, compiled css, and dataset directory
COPY index.html /usr/share/nginx/html/index.html
COPY css/ /usr/share/nginx/html/css/
COPY data/ /usr/share/nginx/html/data/

# Expose HTTP port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
