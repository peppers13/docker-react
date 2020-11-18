# build prod files
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
#all that build goes into /build


# copy prod files and run nginx server
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html