FROM node:latest

COPY chatapp /chatapp

WORKDIR /chatapp

RUN npm install

RUN npm install pusher-js

RUN npm install -D tailwindcss postcss autoprefixer

# RUN npm run build

# RUN npm run dev

# RUN npm run-script build

# ENTRYPOINT ["npm", "start"]
ENTRYPOINT [ "npm", "run", "dev"]
# ENTRYPOINT ["npm", "run", "start"]
