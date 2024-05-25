FROM node:alpine:lastest

WORKDIR /app


ENV name=app


COPY package.json .
RUN npm install
COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start:prod"]