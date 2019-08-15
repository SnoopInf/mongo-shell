###
# Order of instructions has an importance regarding the caching
# of different layers. You need to know that each instruction
# creates a new layer that can be re-used later. So the idea
# is to order instructions from less varying to most varying
# so intermediate layers can be re-used.

FROM debian:jessie-slim
LABEL maintainer="mvachon@samsao.co"

COPY mongo_launch.sh /usr/bin/mongo_launch

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
  echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
  apt-get update && \
  apt-get install -y mongodb-org-tools=4.0.9 mongodb-org-shell=4.0.9 && \
  chmod a+x /usr/bin/mongo_launch && \
  rm -rf /var/lib/apt/lists/*

ENV MONGO_HOST localhost
ENV MONGO_PORT 27017

ENTRYPOINT ["/usr/bin/mongo_launch"]
