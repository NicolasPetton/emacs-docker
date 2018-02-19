FROM ubuntu:16.04

RUN apt-get update --quiet

# Make sure dpkg does not ask questions (such as which keyboard layout to configure)
ENV DEBIAN_FRONTEND noninteractive

# Install misc dependencies:
# - curl, git, make: used by many scripts
# - python: used by Cask
# - ruby, xorg: used by EVM
RUN apt-get install --quiet --assume-yes curl git make python ruby xorg

# Install evm
RUN curl -fsSkL https://raw.github.com/rejeep/evm/master/go | bash
ENV PATH /root/.evm/bin:$PATH

# Install Emacs 25.1
RUN evm config path /tmp
RUN evm install emacs-25.1-travis --use --skip
RUN emacs --version

# Install cask
RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
ENV PATH /root/.cask/bin:$PATH