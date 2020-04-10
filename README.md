# xcompile-raspbian-starter (WIP)

A starter project for cross-compiling your C++ solution for Raspbian using CMake. Currently WIP.

This guide aims to make things as automatic and easy as possible. You still need to go through some steps in order to have a fully functioning working envirnoment.


## 1) Why? And why not Docker?

If you can use `Docker` then go ahead. There might be situations though, where for some reason you are not allowed to install `Docker` on your Pi. 

At such point this starter project can be helpful for you.

## 2) What does it do?

It simply compiles your C++ application for 64bit Linux and for the 32bit PI version. At the end you will have two compiled solutions in the `build` folder:

- application-armv7l  *(PI version)*
- application-x86_64  *(standard Linux version)*

## 2) What dependencies do I need? 

You need:

1) CMake 3.11+

        apt-get install cmake

2) 32-bits libraries

        apt-get install lib32z1

3) A raspbian compiler (follow instructions below)

    Create a folder named `pi` inside the `x-tools` folder.

    Now, `cd pi` and then run

        git clone git://github.com/raspberrypi/tools.git

    This will download the entire PI tools including the compilers you need.

    Watch out: it's almost 2 Gb, so it might take a while to download all of it.

4) The `usr` and `lib` folders from a Raspberry PI

    This is now the boring part. You need to download the `usr` and `lib` from your Raspberry and place them inside the `x-tools/pi/` folder.

    That's going to take a while. The `usr` folder is somewhere around 1Gb.

    The `x-tools/pi/` folder should now look something like this:

        project-root/
            ...
            x-tools/
                armv7l.cmake   
                pi/
                    tools/
                        ...
                    usr/
                        ...
                    lib/
                        ...

    The content of `x-tools/pi` is *gitignored* by default, so you won't be committing gigas and gigas of files.


 
## 3) How do I compile my solution?

By running:

    ./build.sh

You might need to `chmod +x build.sh` before.
