FROM perlur/centos-base AS builder

ENV JORMUNGANDR_VERSION="v0.8.10"

RUN yum update -y && yum install -y nodejs npm
COPY src/ /usr/local/src
WORKDIR /usr/local/src/wordpress/wp-content/themes/staking_2ndlayer_eu
RUN npm install && npm run build