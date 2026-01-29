FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
            aptitude \
            sudo adduser \
            git \
            libwww-perl \
            build-essential
#            libssl-dev libnet-ssleay-perl 

#            build-essential curl ca-certificates 
#            make g++ \
#    apt-get -y clean &&\
#    rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' user
RUN echo 'user ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/user

USER user
WORKDIR /home/user
