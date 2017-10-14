FROM debian:jessie
MAINTAINER Alexandre Savio <alexsavio@gmail.com>

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# utils for local testing
# ENV() { export $1=$2; }; COPY() { cp -rdv $1 $2; };
ENV DEBIAN_FRONTEND=noninteractive

## Configure default locale
RUN echo "deb http://deb.debian.org/debian jessie contrib" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install -qq -y build-essential libssl-dev libxrender-dev libffi-dev \
                              wget git texlive-xetex cm-super \
                              python3 python3-pip && \
    pip3 install -U pip setuptools && \
    pip3 install better_exceptions && \
    pip3 install git+https://github.com/paradoxxxzero/better-exceptions-hook.git && \
    apt-get -y install ttf-mscorefonts-installer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV WORKDIR /usr/src/errbot
WORKDIR $WORKDIR

RUN mkdir -p $WORKDIR && \
    git clone https://github.com/PythonSanSebastian/pyperr.git -b ep2017 . && \
    git clone https://github.com/alexsavio/err-rss.git ./plugins/err-rss && \
    for f in `find -name requirements.txt`; do pip3 install -r $f; done;
