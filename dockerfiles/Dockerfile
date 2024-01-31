FROM mcr.microsoft.com/devcontainers/java:11-bullseye

ARG NPM_VERSION=20

RUN export NVM_DIR=/usr/local/share/nvm && \
    . $NVM_DIR/nvm.sh && \
    nvm install ${NPM_VERSION} && \
    npm install -g @adobe/aio-cli && \
    mkdir /opt/maven && \
    chmod a+wrx /opt/maven

USER vscode

RUN cd /opt/maven && \
    curl https://archive.apache.org/dist/maven/maven-3/3.8.7/binaries/apache-maven-3.8.7-bin.zip -o apache-maven.zip && \
    unzip apache-maven.zip && \
    rm apache-maven.zip && \
    echo y | aio help && \
    aio plugins:install @adobe/aio-cli-plugin-aem-rde && \
    aio plugins:install @adobe/aio-cli-plugin-cloudmanager && \
    aio plugins:update && \
    aio plugins && \
    sudo apt update

RUN sudo apt-get -y install debian-keyring debian-archive-keyring apt-transport-https curl lsb-release && \
    curl -sL 'https://deb.dl.getenvoy.io/public/gpg.8115BA8E629CC074.key' | sudo gpg --dearmor -o /usr/share/keyrings/getenvoy-keyring.gpg && \
    echo a077cb587a1b622e03aa4bf2f3689de14658a9497a9af2c427bba5f4cc3c4723 /usr/share/keyrings/getenvoy-keyring.gpg | sha256sum --check && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/getenvoy-keyring.gpg] https://deb.dl.getenvoy.io/public/deb/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/getenvoy.list && \
    sudo apt update && \
    sudo apt-get -y install getenvoy-envoy && \
    sudo mkdir -p /var/lib/envoy

COPY envoy /var/lib/envoy
RUN sudo chmod +x /var/lib/envoy/init.sh

# JAVA_HOME is incorrectly set, unset it
ENV JAVA_HOME=
ENV PATH=/opt/maven/apache-maven-3.8.7/bin:$PATH

# RUN cd && mkdir temp && cd temp && mvn -B org.apache.maven.plugins:maven-archetype-plugin:3.2.1:generate \
#   -D archetypeGroupId=com.adobe.aem \
#   -D archetypeArtifactId=aem-project-archetype \
#   -D archetypeVersion=40 \
#   -D appTitle="Cache Prime" \
#   -D appId="cacheprime" \
#   -D groupId="com.adobe.cacheprime" && \
#   cd ~/temp/cacheprime && \
#   mvn install -Dmaven.test.skip=true && rm -rf ~/temp && rm -rf ~/.m2/repository/com/adobe/cacheprime
