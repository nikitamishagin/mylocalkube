# Use nginx:alpine as the base image
FROM nginx:alpine

# Create a directory for nginx files
RUN mkdir -p /var/lib/nginx-files && \
    chown -R nginx:nginx /var/lib/nginx-files && \
    chmod 755 /var/lib/nginx-files

# Add a new default configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/
