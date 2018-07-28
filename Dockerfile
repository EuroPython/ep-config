FROM ubuntu:16.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

## Configure default locale
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential ssh python3-pip libssl-dev libffi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD . /epcon

WORKDIR /epcon
RUN pip3 install -U pip ansible==2.5 && \
    ansible-playbook site.yml -i inventory/test
