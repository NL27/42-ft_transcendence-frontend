FROM node:19.4.0-bullseye-slim

COPY chatapp /chatapp

WORKDIR /chatapp

RUN npm install

RUN npm install -D tailwindcss postcss autoprefixer

RUN npx tailwindcss init tailwind.config.cjs -p

# RUN npm run build

# RUN npm run dev

# RUN npm run-script build

# ENTRYPOINT ["npm", "start"]
ENTRYPOINT [ "npm", "run", "dev", "--", "--host"]
# ENTRYPOINT ["npm", "run", "start"]
