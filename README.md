PSAS utility library for NXP LPC23xx uControllers (http://www.nxp.com/).

Top level Makefile builds liblpc23xx.a.

#### common files

The startup directory contains common files for linking an object
file. It also contains files for programming with openocd.

#### gcc version note

export GCC_VERSION=4.x.x to override default gcc version in makefile.

#### usb note

In makefile:

 If you are using port B on the LPC2378 uncomment this line
 LPC2378_PORT    = -DLPC2378_PORTB

## Basic targets

    make will create liblpc23xx.a
    make tests will make hex files for library tests
    make clean will clean objects from subdirectories.
    make allclean will clean objects and all test directories.

## SCM: git Submodules

Adding this library to superproject as a git submodule.

<https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial>

    git submodule add git@github.com:psas/liblpc23xx.git
    git commit -m"Added submodule liblpc23xx.git"
    git submodule init
   

    --- As user of a superproject
    git clone git://serverwherever/path.../superproject.git
    git submodule init
    git submodule update
