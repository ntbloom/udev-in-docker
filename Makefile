# arduino flags

# use the regular board here
BOARD=/dev/ttyACM0
CLI=arduino-cli
FQBN=arduino:samd:mkr1000
PROGRAM=hello

compile:
	$(CLI) compile --fqbn $(FQBN) $(PROGRAM)

upload:
	$(CLI) upload -p $(BOARD) --fqbn $(FQBN) $(PROGRAM)

arduino-all: compile upload

# docker flags
DF_RAW=Dockerfile-raw
IMG_RAW=fd_in_docker_raw
DF_UDEV=Dockerfile-udev
IMG_UDEV=fd_in_docker_udev
RAWFD=/dev/ttyACM0
UDEVFD=/dev/arduino123

RUNFLAGS= --rm
RUNFLAGS+=--device

docker-build:
	docker build . -f $(DF_RAW) -t $(IMG_RAW)
	docker build . -f $(DF_UDEV) -t $(IMG_UDEV)

docker-run-raw:
	docker run $(RUNFLAGS) $(RAWFD) $(IMG_RAW)

docker-run-udev:
	docker run $(RUNFLAGS) $(UDEVFD) $(IMG_UDEV)
