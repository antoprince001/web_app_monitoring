FROM node:13-alpine3.11 AS installer

RUN mkdir /app
WORKDIR /app

COPY package.json /app/

RUN npm install

FROM node:13-alpine3.11

RUN mkdir /app
WORKDIR /app

COPY app.js /app

COPY --from=installer /app/package.json .
COPY --from=installer /app/node_modules ./node_modules

EXPOSE 8080

CMD node app.js