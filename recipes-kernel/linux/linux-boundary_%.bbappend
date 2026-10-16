SRCBRANCH = "ezurio-lf-6.6.y"
SRCREV = "41d4e95b8f9fa4c168dfa6c97e674146dbef3aff"

SRC_URI:remove = "git://github.com/boundarydevices/linux.git;branch=${SRCBRANCH};protocol=https"
SRC_URI:prepend = "git://github.com/nulix/linux.git;branch=${SRCBRANCH};protocol=https"

