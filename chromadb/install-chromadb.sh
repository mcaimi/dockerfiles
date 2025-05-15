#!/bin/bash

USR=${1:-chromadb}
CHROMAVER=${2:-1.0.9}
KUBEVER=${3:-kubernetes}

if [[ $KUBEVER == "openshift" ]]; then
  echo "INSTALLING FOR OPENSHIFT"
  VIRTUALENV_DIR="/tmp/.virtualenv/chromadb"
else
  echo "INSTALLING FOR KUBERNETES"
  VIRTUALENV_DIR="$HOME/.virtualenv/chromadb"
fi

# deploy virtualenv
python3 -m venv $VIRTUALENV_DIR
source $VIRTUALENV_DIR/bin/activate
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir chromadb==$CHROMAVER
