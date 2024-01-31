FROM mcr.microsoft.com/devcontainers/java:11-bullseye

ARG NPM_VERSION=20

RUN export NVM_DIR=/usr/local/share/nvm && \
    . $NVM_DIR/nvm.sh && \
    nvm install ${NPM_VERSION} && \
    npm install -g @adobe/aio-cli

USER vscode

RUN echo y | aio help && \
    aio plugins:install @adobe/aio-cli-plugin-aem-rde && \
    aio plugins:install @adobe/aio-cli-plugin-cloudmanager && \
    aio plugins:update && \
    aio plugins

# JAVA_HOME is incorrectly set, unset it
ENV JAVA_HOME=