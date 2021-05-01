FROM kong:2.3.2
USER root

RUN apk update && \
apk --no-cache add nettle

COPY ./jessica/openid-connect.lua /usr/local/share/lua/5.1/kong/
COPY ./jessica/openid-connect /usr/local/share/lua/5.1/kong/openid-connect
COPY ./jessica/plugins/openid-connect /usr/local/share/lua/5.1/kong/plugins/openid-connect
COPY ./jessica/rocks/1.8.2-1 /usr/local/lib/luarocks/rocks-5.1/openid-connect/1.8.2-1
RUN luarocks install lua-resty-nettle 1.5-1



