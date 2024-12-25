FROM node:16.20.2-slim

ARG ENV_FILE

WORKDIR /app
COPY frontend/package.json frontend/yarn.lock $ENV_FILE ./
RUN yarn install

COPY frontend .
RUN cp $ENV_FILE .env
RUN yarn build

EXPOSE 3000

CMD [ "yarn", "start" ]