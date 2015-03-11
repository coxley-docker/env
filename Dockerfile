FROM ubuntu:14.04
MAINTAINER Codey Oxley

ADD packages.txt /root/packages.txt
RUN apt-get update && apt-get install -y $(cat /root/packages.txt)
WORKDIR /root
RUN curl -L \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN mkdir projects
WORKDIR projects
RUN git clone https://github.com/coxley/dotfiles.git
WORKDIR dotfiles
RUN zsh init.sh
WORKDIR /root
CMD zsh
