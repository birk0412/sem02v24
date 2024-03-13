FROM ubuntu:24.04
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get autoremove -y \
 && apt-get autoclean -y \
 && apt-get install -y \
 sudo \
 nano \
 wget \
 curl \
 git \
 build-essential \
 gcc \
 openjdk-21-jdk \
 mono-complete \
 python3 \
 strace \
 valgrind
RUN useradd -G sudo -m -d /home/BRUKERNAVN -s /bin/bash -p "$(openssl passwd -1 Stormnaldo1)" BRUKERNAVN
USER BRUKERNAVN
WORKDIR /home/BRUKERNAVN
RUN mkdir hacking \
 && cd hacking \
 && curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh > pawned.sh \
 && chmod 764 pawned.sh \
 && cd ..
RUN git config --global user.email "birkaa@uia.com"\
 && git config --global user.name "birk0412" \
 && git config --global url."https://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:@github.com/".insteadOf "https://github.com" \
 && mkdir -p Github.com/Birk0412/sem02v24
USER root
RUN curl -SL https://go.dev/dl/go1.22.1.linux-amd64.tar.gz | tar xvz -C /usr/local
USER BRUKERNAVN
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/birk0412/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"

RUN curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="${PATH}:${HOME}/.cargo/bin"