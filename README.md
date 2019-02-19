# xcompile-raspbian-starter (WIP)

A starter project for cross-compiling your C++ solution for Raspbian using CMake. Currently WIP.


## 1) Why? And why not Docker?

If you can use `Docker` then go ahead. There might be situations though, where for many reasons, you are not allowed to install `Docker` on your Raspberry PI. 

At such point, this starter project might be helpful for you.

## 2) What does it do?

It simply compiles your C++ application for 64bit Linux and for the 32bit PI version. At the end you will have two compiled solutions in the `build` folder:

- application-armv7l  *(PI version)*
- application-x86_64  *(standard Linux version)*

## 2) What dependencies do I need? 

You need:

- CMake 3.11+

        apt-get install cmake

- 32-bits libraries

        apt-get install lib32z1

- A raspbian compiler (follow instructions below)

## 3) How do I compile my solution?

By running:

    ./build.sh

You might need to `chmod +x build.sh` before.