# frontend/Dockerfile

# 1. Build stage
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files and install deps
COPY package*.json ./
RUN npm install

# Copy source and build
COPY . .
RUN npm run build

# 2. Serve with Nginx
FROM nginx:alpine
# Remove default site config if you’ll replace it, otherwise default is fine
# COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
