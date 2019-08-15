###
# Order of instructions has an importance regarding the caching
# of different layers. You need to know that each instruction
# creates a new layer that can be re-used later. So the idea
# is to order instructions from less varying to most varying
# so intermediate layers can be re-used.

FROM debian:jessie-slim
LABEL maintainer="snoopinf@gmail.com"

COPY mongo_launch.sh /usr/bin/mongo_launch

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
  echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
  apt-get update && \
  apt-get install -y mongodb-org-tools=4.0.9 mongodb-org-shell=4.0.9 && \
  chmod a+x /usr/bin/mongo_launch && \
  rm -rf /var/lib/apt/lists/*

ENV MONGO_HOST localhost
ENV MONGO_PORT 27017

ENTRYPOINT ["/bin/sh"]
