FROM armv7/armhf-ubuntu:16.04
RUN apt-get update && \
    apt-get install -y curl gnutls-bin python ruby git build-essential libncurses5-dev && \
    apt-get build-dep emacs -y

# Install evm
RUN curl -fsSkL https://raw.github.com/rejeep/evm/master/go | bash
ENV PATH /root/.evm/bin:$PATH

# Install Emacs 25.1
RUN evm config path /tmp
RUN evm install emacs-25.1 --use --skip
RUN emacs --version

# Install cask
RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
ENV PATH /root/.cask/bin:$PATH