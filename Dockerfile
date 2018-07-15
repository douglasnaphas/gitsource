FROM fedora
LABEL Description="Builds git from source, installed entrypoint updates master"
LABEL Maintainer="Douglas Naphas <douglasnaphas@gmail.com>"
RUN yum install -y \
                   asciidoc \
                   autoconf \
                   curl-devel \
                   expat-devel \
                   gcc \
                   gettext-devel \
                   git \
                   make \
                   openssl-devel \
                   perl-ExtUtils-MakeMaker \
                   procps \
                   which \
                   xmlto \
                   zlib-devel \
    && \
    cd /usr/local/src \
    && \
    git clone https://github.com/git/git.git \
    && \
    cd git \
    && \
    autoconf \
    && \
    ./configure \
    && \
    make && make install \
    && \
    make man && make install-man
COPY ["update-git.sh", "/usr/local/bin/update-git.sh"]
