# Various Dockerfiles.

## Firefox

[![Docker Repository on Quay](https://quay.io/repository/marcocaimi/firefox/status "Docker Repository on Quay")](https://quay.io/repository/marcocaimi/firefox)

A simple firefox container that can be run in rootless podman to have a semi-throwaway browser for all sorts of use cases.
It is based on the latest Archlinux base image from docker.io, and optionally supports:

  * Pulseaudio passthrough
  * Overlay mount of the download directory and of the local Mozilla profile if needed

Currently it is tested on Xorg only.

## UBI8 based Debug Container for OCP4

[![Docker Repository on Quay](https://quay.io/repository/marcocaimi/ocp-debug-ubi8/status "Docker Repository on Quay")](https://quay.io/repository/marcocaimi/ocp-debug-ubi8)

A custom debug container that can be used to do debugging work on a running CoreOS Openshift Node instead of the standard one shipped with OCP.
It is based on the RedHat Universal Base Image 8, with some added tools:

  * EPEL repo for rhel8 baked in
  * openJDK 11 development kit
  * GCC & GDB
  * tcpdump
  * iproute
  * jq
  * python 3.9
  * scapy
  * curlie & httpie
  * glances
  * hping3
  * rsync & rclone

To run it simply use the Openshift Command Line tool:

```bash
  $ oc debug node/<node-id> --image quay.io/marcocaimi/ocp-debug-ubi8:ubi8
```

Currently it is still in development, so expect bugs here and there


