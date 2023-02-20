FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

# If content is copied from that place it'll be 
# automatically picked and served by nginx
COPY --from=builder /app/build /usr/share/nginx/html

# nginx image has default startup command which we can use
