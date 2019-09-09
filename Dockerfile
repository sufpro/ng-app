#STAGE@1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#STAGE@2
FROM nginx:alpine
COPY --from=node /app/dist/ngapp /usr/share/nginx/html