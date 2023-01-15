FROM node:10

COPY chatapp /chatapp

WORKDIR /chatapp

RUN npm install

RUN npm install pusher-js

ENTRYPOINT ["npm", "run", "start:dev"]