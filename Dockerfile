FROM ubuntu:14.04

MAINTAINER Appcues Engineering <dev+docker@appcues.com>

RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install git curl gcc locales && apt-get -y install build-essential && curl -o /tmp/erlang.deb https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i /tmp/erlang.deb && rm /tmp/erlang.deb && apt-get -y update && apt-get -y install esl-erlang && apt-get -y install elixir && apt-get clean -y

ENV LANG=en_US.UTF-8

RUN mix local.hex --force && \
    mix local.rebar --force