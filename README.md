# Various Dockerfiles.

## Firefox

[![Docker Repository on Quay](https://quay.io/repository/marcocaimi/firefox/status "Docker Repository on Quay")](https://quay.io/repository/marcocaimi/firefox)

A simple firefox container that can be run in rootless podman to have a semi-throwaway browser for all sorts of use cases.
It is based on the latest Archlinux base image from docker.io, and optionally supports:

  * Pulseaudio passthrough
  * Overlay mount of the download directory and of the local Mozilla profile if needed

Currently it is tested on Xorg only.


