FROM kong:2.3.2
USER root
RUN apk update && \
    apk --no-cache add git zip unzip
COPY . /kong-oidc

RUN cd /kong-oidc && \
    luarocks make kong-oidc-1.2.3-1.rockspec && \
    luarocks install lua-resty-dns && \
    luarocks install lua-resty-jit-uuid && \
    luarocks install lua-resty-dns-client


RUN rm -r /kong-oidc