FROM ubuntu:18.04

COPY . /dotfiles

ENV TERM xterm

# No need to remove cache because even if we clean it dotfiles will pollute it again
RUN apt-get -y update && apt-get -y install \
  curl \
  sudo

RUN cd /dotfiles \
  && ./install.sh

WORKDIR /root
SHELL ["/usr/bin/fish", "-c"]
CMD ["fish"]
