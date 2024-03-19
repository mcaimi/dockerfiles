#!/bin/bash

CHROMAHOST=${1:-localhost}
CHROMAPORT=${2:-8080}

# ChromaDB startup script
source $HOME/.virtualenv/chromadb/bin/activate
pip list
chroma run --host $CHROMAHOST --port $CHROMAPORT --path /chroma_data
