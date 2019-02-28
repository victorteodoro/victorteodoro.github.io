FROM node:alpine AS builder

WORKDIR /APP

COPY ./package.json .
RUN npm install
COPY . .

RUN npm run builder

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html