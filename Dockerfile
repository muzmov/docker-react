FROM node:10.15.3-alpine as builder
WORKDIR /usr/app
ADD package.json .
RUN npm install
ADD . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder usr/app/build /usr/share/nginx/html