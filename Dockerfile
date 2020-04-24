FROM node:10 as build

WORKDIR /app

COPY . .

RUN yarn install
RUN yarn run prod:build

FROM node:10-alpine

WORKDIR /app

COPY --from=build /app .

CMD yarn run prod:start