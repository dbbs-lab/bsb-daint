PREVIOUS_DIR=$PWD

export CRAYPE_LINK_TYPE=dynamic

cd
rm -rf cereb-nest
git clone https://github.com/dbbs-lab/cereb-nest/
cd cereb-nest
mkdir build
cd build
CEREBNEST_BUILD_DIR=$PWD
export NEST_INSTALL_DIR=$HOME/nest-2.18.0-install
cmake -Dstatic-libraries=OFF -Dwith-nest=${NEST_INSTALL_DIR}/bin/nest-config ..
make -j
make install
cd $PREVIOUS_DIR
