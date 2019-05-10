FROM ubuntu:18.04

WORKDIR /root

# No need to remove cache because even if we clean it dotfiles will pollute it again
RUN apt-get -y update \
  && apt-get -y install \
    curl \
    sudo \
    wget \
    locales \
  && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV TERM=xterm \
  LC_ALL=en_US.UTF-8 \
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8

COPY . /root/dotfiles

RUN cd /root/dotfiles \
  && ./install.sh \
  && rm -rf /var/lib/apt/lists/*

CMD ["fish", "-l"]
