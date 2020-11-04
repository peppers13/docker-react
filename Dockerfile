# build prod files
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#all that build goes into /build


# copy prod files and run nginx server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html