ARG LIQUIBASE_VERSION
FROM liquibase/liquibase:${LIQUIBASE_VERSION} as builder

USER root

RUN apt update && apt install -yq --no-install-recommends \
    curl  \
    libdigest-sha-perl && \
    apt-get -y clean && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

ARG MONGODB_SHA=e39daee7a5e64c9881bc41bcb6e531be6aa4ca1e
ARG LIQUIBASE_MONGODB_SHA=2efb513654a2c16909fdf3d6711fc67e0cb77513
RUN curl -sSL -o /liquibase/lib/mongodb.jar https://repo1.maven.org/maven2/org/mongodb/mongo-java-driver/3.12.9/mongo-java-driver-3.12.9.jar \
	&& echo "${MONGODB_SHA}  /liquibase/lib/mongodb.jar" | shasum -c - \
    && curl -sSL -o /liquibase/lib/liquibase-mongodb.jar https://github.com/liquibase/liquibase-mongodb/releases/download/liquibase-mongodb-4.11.0/liquibase-mongodb-4.11.0.jar \
    && echo "${LIQUIBASE_MONGODB_SHA}  /liquibase/lib/liquibase-mongodb.jar" | shasum -c - \
    && curl -sSL -o /liquibase/lib/jackson-annotations-2.12.1.jar https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.12.1/jackson-annotations-2.12.1.jar \
    && curl -sSL -o /liquibase/lib/jackson-core-2.12.1.jar https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.12.1/jackson-core-2.12.1.jar \
    && curl -sSL -o /liquibase/lib/jackson-databind-2.12.1.jar https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.12.1/jackson-databind-2.12.1.jar

FROM liquibase/liquibase:${LIQUIBASE_VERSION}

COPY --from=builder /liquibase/lib/mongodb.jar /liquibase/lib/mongodb.jar
COPY --from=builder /liquibase/lib/liquibase-mongodb.jar /liquibase/lib/liquibase-mongodb.jar
COPY --from=builder /liquibase/lib/jackson-annotations-2.12.1.jar /liquibase/lib/jackson-annotations-2.12.1.jar
COPY --from=builder /liquibase/lib/jackson-core-2.12.1.jar /liquibase/lib/jackson-core-2.12.1.jar
COPY --from=builder /liquibase/lib/jackson-databind-2.12.1.jar  /liquibase/lib/jackson-databind-2.12.1.jar
