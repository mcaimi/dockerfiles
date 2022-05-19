FROM registry.access.redhat.com/ubi9/ubi:latest

USER root
RUN dnf update -y && \
    dnf install -y \
        https://github.com/rs/curlie/releases/download/v1.6.9/curlie_1.6.9_linux_amd64.rpm \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
        http://mirror.stream.centos.org/9-stream/AppStream/x86_64/os/Packages/tcpdump-4.99.0-6.el9.x86_64.rpm

RUN dnf install -y \
        java-11-openjdk-devel \
        iproute \
        python3-pip \
        nmap \
        nmap-ncat \
        p7zip \
        sg3_utils \
        procps \
        rsync \
        rclone \
        neovim \
        gdb \
        skopeo \
        jq && dnf clean all

RUN pip3 install httpie glances scapy matplotlib cryptography ipython

VOLUME /host
WORKDIR /root/

