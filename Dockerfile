FROM node:alpine:lastest

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

RUN npm run build

CMD ["npm", "start:prod"]