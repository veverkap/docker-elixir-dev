FROM ubuntu:14.04

MAINTAINER Appcues Engineering <dev+docker@appcues.com>

RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install git curl locales
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install build-essential
RUN export DEBIAN_FRONTEND=noninteractive && curl -o /tmp/erlang.deb https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i /tmp/erlang.deb && rm /tmp/erlang.deb
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install esl-erlang
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install elixir
RUN export DEBIAN_FRONTEND=noninteractive && apt-get clean -y

ENV LANG=en_US.UTF-8

RUN mix local.hex --force && \
    mix local.rebar --force