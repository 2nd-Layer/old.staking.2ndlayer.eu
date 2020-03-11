FROM perlur/centos-base AS builder

RUN yum update -y && yum install -y nodejs npm
COPY src/ /usr/local/src
WORKDIR /usr/local/src/wordpress/wp-content/themes/staking_2ndlayer_eu

RUN npm install
RUN npm run build

FROM perlur/centos-wordpress

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "staking.2ndlayer.eu"

RUN yum update -y && yum install -y nodejs npm
RUN yum clean all && rm -rf /var/cache/yum

WORKDIR /var/www/default/html

COPY --from=builder /usr/local/src/wordpress/ /var/www/default/html/
