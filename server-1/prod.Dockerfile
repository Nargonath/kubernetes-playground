FROM node:12-alpine

WORKDIR /server

COPY package*.json ./
RUN npm ci

COPY . .

CMD ["npm", "start"]
