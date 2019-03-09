FROM node:alpine as builder
WORKDIR /usr/app
ADD package.json .
RUN npm install
ADD . .
RUN npm run build

FROM nginx
COPY --from=builder usr/app/build /usr/share/nginx/html