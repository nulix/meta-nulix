SRCBRANCH = "ezurio-lf-6.6.y"
SRCREV = "dd7549dc65537603fe4ed07ec7a0fd80e2472724"

SRC_URI:remove = "git://github.com/boundarydevices/linux.git;branch=${SRCBRANCH};protocol=https"
SRC_URI:prepend = "git://github.com/nulix/linux.git;branch=${SRCBRANCH};protocol=https"

