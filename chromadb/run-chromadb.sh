#!/bin/bash

CHROMAHOST=${1:-localhost}
CHROMAPORT=${2:-8080}
KUBEVER=${3:-kubernetes}

# ChromaDB startup script
if [[ $KUBEVER == "openshift" ]]; then
  echo "RUNNING ON OPENSHIFT"
  VIRTUALENV_DIR="/tmp/.virtualenv/chromadb"
else
  echo "RUNNING ON KUBERNETES"
  VIRTUALENV_DIR="$HOME/.virtualenv/chromadb"
fi

# run chromadb
source $VIRTUALENV_DIR/bin/activate
pip list
chroma run --host $CHROMAHOST --port $CHROMAPORT --path /chroma_data
