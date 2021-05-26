ARG ELASTICSEARCH_VERSION
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELASTICSEARCH_VERSION}

RUN bin/elasticsearch-plugin install --batch repository-gcs
