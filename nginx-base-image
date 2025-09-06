# Use lightweight nginx base image
FROM nginx:alpine

# Install AWS CLI and tar
RUN apk add --no-cache \
      python3 \
      py3-pip \
      groff \
      less \
      bash \
      tar \
    && pip3 install --no-cache-dir awscli \
    && rm -rf /var/cache/apk/*
