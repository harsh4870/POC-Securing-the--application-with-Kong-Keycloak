FROM kong:latest

LABEL description="Alpine + Kong 2.0.4 + kong-oidc plugin"

USER root
RUN apk update && apk add git unzip luarocks
#RUN luarocks install kong-oidc
RUN luarocks install kong-enhanced-oidc
RUN luarocks install kong-plugin-jwt-keycloak

WORKDIR /custom-plugins/pepkong
COPY ./kong/plugins/pepkong /custom-plugins/pepkong
RUN luarocks make

USER kong
