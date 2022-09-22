# fd-in-docker

## use custom udev file descriptors inside your docker containers

Proof of concept to show how to use udev rules inside of a docker container.
Shown on Fedora36 with Docker 20.10.18, build b40c2f6.

### udev rules

```sh
SUBSYSTEMS=="usb", KERNEL=="ttyACM[0-9]*", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="804e", SYMLINK+="arduino123", MODE:="0666", GROUP="dialout"
```
