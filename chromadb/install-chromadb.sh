#!/bin/bash

USR=${1:-chromadb}
CHROMAVER=${2:-0.6.3}

python3 -m venv $HOME/.virtualenv/chromadb
source $HOME/.virtualenv/chromadb/bin/activate
pip install --upgrade pip
pip install chromadb==$CHROMAVER
