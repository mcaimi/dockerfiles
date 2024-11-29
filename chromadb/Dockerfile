FROM docker.io/library/fedora:latest as chromabuilder

ENV appuser chromadb
ENV appgroup chromadb
ENV chromaversion 0.5.20

USER root
RUN dnf install -y python3-pip python3-devel lapack-devel gcc g++ gfortran && dnf clean all

RUN groupadd $appgroup && useradd -m -g $appgroup $appuser
ADD ./install-chromadb.sh /home/$appuser/
RUN chown -R $appuser /home/$appuser/install-chromadb.sh && chmod u+rwx /home/$appuser/install-chromadb.sh

USER $appuser
WORKDIR /home/$appuser
RUN /home/$appuser/install-chromadb.sh $appuser $chromaversion

FROM docker.io/library/fedora:latest

ENV appuser chromadb
ENV appgroup chromadb
ENV CHROMAHOST localhost
ENV CHROMAPORT 8080

USER root
RUN dnf install -y python3-pip lapack

RUN groupadd $appgroup && useradd -m -g $appgroup $appuser
COPY --from=chromabuilder /home/$appuser/.virtualenv /home/$appuser/.virtualenv
ADD ./run-chromadb.sh /home/$appuser/
RUN chown -R $appuser /home/$appuser/run-chromadb.sh && chmod u+rwx /home/$appuser/run-chromadb.sh

RUN mkdir -p /chroma_data && chown -R $appuser /chroma_data
VOLUME /chroma_data

USER $appuser
WORKDIR /home/$appuser

ENTRYPOINT ["./run-chromadb.sh"]
CMD ["$CHROMAHOST", "$CHROMAPORT"]
