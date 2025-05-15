# Use Fedora as base image
FROM fedora:latest AS chromabuilder

# Set environment variables for app user, group, and ChromaDB version
ENV appuser=chromadb \
    appgroup=chromadb \
    chromaversion=1.0.9 \
    kubever=kubernetes

# Switch to root user for installation
USER root

# Install necessary dependencies
RUN dnf install -y python3-pip python3-devel lapack-devel gcc g++ gfortran && dnf clean all

# Create app group and user, then add the install script
RUN groupadd $appgroup && \
    useradd -m -g $appgroup $appuser
ADD ./install-chromadb.sh /home/$appuser/

# Change ownership of the install script to the app user
RUN chown -R $appuser /home/$appuser/install-chromadb.sh && \
    chmod u+rwx /home/$appuser/install-chromadb.sh

# Switch back to the app user for installation
USER $appuser
WORKDIR /home/$appuser

# Run the ChromaDB installation script
RUN /home/$appuser/install-chromadb.sh $appuser $chromaversion $kubever

# Use Fedora as base image again
FROM fedora:latest

# Set environment variables for app user, group, and ChromaDB host and port
ENV appuser=chromadb \
    appgroup=chromadb \
    CHROMAHOST=localhost \
    CHROMAPORT=8080 \
    KUBEVER=kubernetes

# Switch to root user for installation of dependencies
USER root
RUN dnf install -y python3-pip lapack

# Create app group and user, then copy the virtualenv directory from the builder stage
RUN groupadd $appgroup && \
    useradd -m -g $appgroup $appuser
COPY --from=chromabuilder /home/$appuser/.virtualenv /home/$appuser/.virtualenv

# Add the run script and change ownership to the app user
ADD ./run-chromadb.sh /home/$appuser/
RUN chown -R $appuser /home/$appuser/run-chromadb.sh && \
    chown -R $appuser /home/$appuser/.virtualenv && \
    chmod ugo+rwx /home/$appuser/run-chromadb.sh

# Create a volume for ChromaDB data storage
RUN mkdir -p /chroma_data && \
    chown -R $appuser /chroma_data
VOLUME /chroma_data

# Switch back to the app user and set working directory
USER $appuser
WORKDIR /home/$appuser

# Set entrypoint and command for running ChromaDB
ENTRYPOINT ["./run-chromadb.sh"]
CMD ["$CHROMAHOST", "$CHROMAPORT", "$KUBEVER"]
