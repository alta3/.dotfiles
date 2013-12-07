FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update 
ENV USER_NAME michael

RUN apt-get install -y \
    python \
    libc6-dev \
    mercurial \
    git-core \
    libbz2-dev \
    libreadline-dev \
    wget \
    curl \
    tmux \
    htop \
    gdb \
    tcpflow \
    ctags \
    tree \
    mosh \
    vim \
    openssh-server

# Create ssh server dir path
RUN mkdir -p /var/run/sshd &&  mkdir -p /home/michael

# Setup user information
RUN adduser --disabled-password --gecos "" michael
RUN echo "root\nroot\n" | passwd michael
RUN chsh -s /usr/local/bin/fish michael
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ADD . /home/michael/.dotfiles
RUN cd /home/michael/.dotfiles && git submodule update --init

RUN ./home/michael/.dotfiles/install-fish.sh
RUN ./home/michael/.dotfiles/install-go.sh
RUN ./home/michael/.dotfiles/user.sh

RUN chown -R michael:michael /home/michael

EXPOSE 22
ENTRYPOINT /usr/sbin/sshd -D
