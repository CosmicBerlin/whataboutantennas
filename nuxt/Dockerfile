FROM node:12.18

COPY . /app
WORKDIR /app

RUN npm i -g yarn --force
RUN yarn install
RUN yarn build

ENV HOST 0.0.0.0

CMD ["yarn", "start"]
