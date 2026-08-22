FROM nginx:alpine

# Copy static application assets and dataset directory
COPY index.html /usr/share/nginx/html/index.html
COPY data/ /usr/share/nginx/html/data/

# Expose HTTP port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
