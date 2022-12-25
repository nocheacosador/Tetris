# Console tetris

This a tetris implementation that runs inside your terminal/console.

## Setup

### Windows

To build on windows you will need to install mingw and make. You can 
do that using [chocolatey](https://chocolatey.org/). Run these commands
in elevated console:

```console
 $ choco install make
 $ choco install mingw
```

You will also need to build [PDCurses](https://github.com/wmcbrine/PDCurses).

```console
 $ git clone https://github.com/wmcbrine/PDCurses.git   # clone repo
 $ cd PDCurses/wincon
 $ make libs                                            # build pdcurses
 $ cd ../..                                             # return to root
```

### Linux and other Unix-like systems

You should be all set.

## Build & Run

To build and run this project clone this repo, go to the root and excecute
these commands:

```console
 $ make
 $ ./bin/tetris
```