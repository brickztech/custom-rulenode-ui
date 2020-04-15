FROM ubuntu:16.04

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG app_name

ENV APP_NAME $app_name
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 5.9.0

 RUN apt update && \
    apt install -y curl git libpng-dev && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
    source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

WORKDIR /usr/src/$APP_NAME
COPY . .

RUN npm install
