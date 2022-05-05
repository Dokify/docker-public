FROM openresty/openresty:1.19.9.1-bionic

RUN apt-get update && apt-get install -y vim libexpat1-dev && \
    cpan -T -i Test::Nginx \
        YAML::Tiny \
        XML::Parser \
        XML::SemanticDiff \
        Test::XML \
        TAP::Harness::Archive \
        IPC::Run \
        TAP::Formatter:JUnit && \
    luarocks install lua-resty-openssl && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/usr/local/openresty/nginx/sbin
