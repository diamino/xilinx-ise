# xilinx-ise

## Xilinx ISE 14.7 in Docker

> This is a modified version of the build script by Christopher Harnischmacher.

Two shell scripts are included: `xilinx` and `startise`. `xilinx` allows execution of e.g. `impact` inside the docker container. The current working directory is mounted to `/build`.
`startise` is a wrapper script to start ISE with the GUI attached to an X Server running on the Docker host.

Example `xilinx` script:
```
xilinx impact -batch my.cmd
```
The `xilinx` command is executed in the current working directory by default. If you like to use another location as the working dir set up the `XILINX_WORK` environment variable to point to the desired directory. 

To start `xilinx` from any directory just copy `xilinx` to a directory in your `PATH`.

## Build

To build the docker image, do the following:

1. Make sure you have enough space available to create the docker image. The install files take 8GB, the final image needs about 20GB.

1. Download [Xilinx ISE 14.7](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/design-tools/v2012_4---14_7.html). You will to have to create an account to download the files. Download the single file installer (`Xilinx_ISE_DS_14.7_1015_1.tar`):
    - [Full DVD Single File Download Image](https://www.xilinx.com/member/forms/download/xef.html?filename=Xilinx_ISE_DS_14.7_1015_1.tar)

1. Copy Downloads to xilinx-installer folder:
    ```
    cp ~/Downloads/Xilinx_ISE_DS_14.7_1015_1.tar xilinx-installer/
    ```

1. Run docker build:
    ```
    ./build
    ```

## Run

1. After that you can test this with:
    ```
    ./xilinx impact -h
    ```
    to see this output:
    ```
    user@machine ~/xilinx-ise # ./xilinx impact -h
    . /opt/Xilinx/14.7/ISE_DS/common/.settings64.sh /opt/Xilinx/14.7/ISE_DS/common
    . /opt/Xilinx/14.7/ISE_DS/EDK/.settings64.sh /opt/Xilinx/14.7/ISE_DS/EDK
    . /opt/Xilinx/14.7/ISE_DS/PlanAhead/.settings64.sh /opt/Xilinx/14.7/ISE_DS/PlanAhead
    . /opt/Xilinx/14.7/ISE_DS/ISE/.settings64.sh /opt/Xilinx/14.7/ISE_DS/ISE
    Release 14.7 - iMPACT P.20131013 (lin64)
    Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
    Usage: impact [-batch {<file>}] [-c|-cdf <file>] [-intstyle] [-j|-jedec <file>]
    [-b|-bitstream <file>] [-p|-prom <file>] [-i|-isc <file>] [-port
    auto|lpt1|lpt2|lpt3|com1|com2|com3|com4|usb0|usb1|usb2|ttya|ttyb|tty00|tty01]
    [-mode bscan|smap|sserial|cf|mpm|bsfile|dtconfig|pff|promfile|config|file]
    [-baud 9600|19200|38400|57600|auto] {-pref <name_value>} [-ipf <file>]
    [-autoassign] [ise|pa]
    user@machine ~/xilinx-ise #
    ```

1. Create a free license via the [Licensing Solution Center](https://www.xilinx.com/getlicense)

1. Add license to your home dir:
    ```
    mkdir -p $HOME/.Xilinx
    cp ~/Downloads/Xilinx.lic $HOME/.Xilinx/
    ```
    The license is mounted into the docker container from `$HOME/.Xilinx/Xilinx.lic` by default. If you like to use another location set up the `XILINX_LIC` environment variable to point to the `Xilinx.lic` file.

1. You can start ISE with the graphical user interface with:
    ```
    ./startise
    ```
    To change the default working directory (current directory) you can set the `XILINX_WORK` environment variable to point to the desired location.
