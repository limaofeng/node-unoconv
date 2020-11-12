FROM ubuntu:16.04

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:libreoffice/ppa

# Fix issue:  Fontconfig error: Cannot load default config file
ENV FONTCONFIG_PATH=/etc/fonts

# # Install Packages
RUN apt-get update && apt-get install \
    build-essential \
    python3-pip \
    curl \
    wget \
    libreoffice \
    hyphen-fr \
    hyphen-de \
    hyphen-en-us \
    hyphen-it \
    hyphen-ru \
    ttf-wqy-zenhei \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    fonts-dejavu \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    fonts-dustin \
    fonts-f500 \
    fonts-fanwood \
    fonts-freefont-ttf \
    fonts-liberation \
    fonts-lmodern \
    fonts-lyx \
    fonts-sil-gentium \
    fonts-texgyre \
    fonts-tlwg-purisa \
    --assume-yes \
    --fix-missing \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install unoconv

# Install latest version ImageMagick
RUN wget https://www.imagemagick.org/download/ImageMagick.tar.gz && \
    tar xf ImageMagick.tar.gz && \
    cd ImageMagick-7* && \
    ./configure && \
    make && \
    make install && \
    ldconfig /usr/local/lib

# Install graphicsmagick
RUN apt-get update && apt-get -y install graphicsmagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG="zh_CN.UTF-8"

ENTRYPOINT [""]