FROM node:alpine AS build

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /usr/src/app/dist/angular-sample-small-project /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
