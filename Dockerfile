FROM node:18-alpine as builder

RUN apk update &&  \
    apk add git &&  \
    mkdir /repo

WORKDIR /repo

RUN git clone https://github.com/viliusle/miniPaint.git && \
    cd miniPaint && \
    rm dist || exit 0 \
    git checkout tags/v4.10.0 # checkout specific version, change here to any tagged version from https://github.com/viliusle/miniPaint.git

WORKDIR /repo/miniPaint

RUN npm update -y &&  \
    npm init -y && \
    npm run build # create production build according to https://github.com/viliusle/miniPaint/wiki/Build-instructions

FROM nginx:1.23-alpine

MAINTAINER Patrick Favre-Bulle

# copy build files from builder to nginx
COPY --from=builder /repo/miniPaint/index.html /usr/share/nginx/html/index.html
COPY --from=builder /repo/miniPaint/images /usr/share/nginx/html/images
COPY --from=builder /repo/miniPaint/dist /usr/share/nginx/html/dist

HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

EXPOSE 80/tcp
