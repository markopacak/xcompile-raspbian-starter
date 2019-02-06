SET (CMAKE_SYSTEM_NAME Linux)
SET (CMAKE_SYSTEM_VERSION 1)
SET (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11" )

# Set the path to your Raspbian compiler here

SET (CMAKE_C_COMPILER /home/mp/pi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-gcc)
SET (CMAKE_CXX_COMPILER /home/mp/pi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++)
SET (CMAKE_FIND_ROOT_PATH /home/mp/pi/tools/rootfs)
SET (CMAKE_FIND_ROOT_PATH_MODE_PRGRAM NEVER)
SET (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)