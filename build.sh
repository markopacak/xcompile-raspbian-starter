
propsfile="./build.properties"

 
############## Properties

# The name of your solution
# At the end you will have in the build folder:
# - application-armv7l (solution for PI)
# - application-x86_64 (solution for standard Linux)
APPNAME='application'

# Whether you want the two built solution to automatically pack into two tar.gz
BUILDTAR=true 

############## Properties


echo "####### Started build for" ${APPNAME}