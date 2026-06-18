FROM nginx:alpine

# Maintainer label
LABEL maintainer="arc427" \
      project="final2" \
      description="Tripillar Solutions static website served via Nginx"

# Remove default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy static website files into Nginx's serving directory
COPY docs/index.html /usr/share/nginx/html/index.html
COPY docs/styles.css /usr/share/nginx/html/styles.css
COPY docs/logo.jpeg /usr/share/nginx/html/logo.jpeg

# Expose port 80 (Nginx default)
EXPOSE 80

# Start Nginx in the foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]
