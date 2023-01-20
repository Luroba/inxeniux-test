## Dependencias de docker: 

FROM node:16

WORKDIR /app

## Para instalar dependencias de node_modules
COPY package*.json ./ 

RUN npm install

COPY . .

CMD ["npm", "start"]