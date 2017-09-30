FROM java:8-jre-alpine

ARG ELASTICSEARCH_VERSION

WORKDIR /opt

# Install Elasticsearch
RUN set -x && \
      apk add --no-cache --virtual .builddeps openssl && \
      apk add --no-cache bash && \
      wget -O - "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz" | tar zxvf - && \
      mv elasticsearch-${ELASTICSEARCH_VERSION} elasticsearch && \
      apk del .builddeps

# Copy config files
ADD config/ /opt/elasticsearch/config/

# Copy plugins list
ADD plugins.txt /tmp/plugins.txt 

# Install plugins
RUN set -x && \
      while read -r plugin ; do elasticsearch/bin/elasticsearch-plugin install --batch ${plugin}; done < /tmp/plugins.txt

# Change Owner
RUN set -x && \
      addgroup -S elasticsearch -g 2000 && adduser -S elasticsearch -u 1000 elasticsearch  && \
      chown -R elasticsearch:elasticsearch elasticsearch 

USER elasticsearch

EXPOSE 9200 9300

ENTRYPOINT ["/bin/bash", "/opt/elasticsearch/bin/elasticsearch"]
