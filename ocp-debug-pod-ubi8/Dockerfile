FROM registry.access.redhat.com/ubi8/ubi:latest

USER root
RUN dnf update -y && \
    dnf install -y \
        https://github.com/rs/curlie/releases/download/v1.6.7/curlie_1.6.7_linux_amd64.rpm \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
        http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/tcpdump-4.9.3-2.el8.x86_64.rpm

RUN dnf install -y \
        java-11-openjdk-devel \
        iproute \
        python39-pip \
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
        hping3 \
        jq && dnf clean all

RUN pip3 install httpie glances scapy matplotlib cryptography ipython

VOLUME /host
WORKDIR /root/

