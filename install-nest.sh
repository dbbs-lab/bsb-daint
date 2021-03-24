module load daint-mc
module unload PrgEnv-gnu/6.0.9
module load PrgEnv-cray/6.0.0
module load PyExtensions/python3-CrayGNU-20.11
module load GSL/2.5-CrayCCE-20.11

export CRAYPE_LINK_TYPE=dynamic

CDIR=$PWD
cd
rm -rf nest-simulator
git clone https://github.com/dbbs-lab/nest-simulator.git --depth 1
mkdir build
cd build
rm -rf nest-2.18.0-install/

cmake \
  -Dwith-mpi=ON \
  -Dwith-python=3 \
  -DPYTHON_EXECUTABLE=/opt/python/3.8.5.0/bin/python \
  -DPYTHON_LIBRARY=/opt/python/3.8.5.0/lib/libpython3.8.so \
  -DPYTHON_INCLUDE_DIR=/opt/python/3.8.5.0/include/python3.8 \
  -DCMAKE_CXX_COMPILER=CC \
  -DCMAKE_C_COMPILER=cc \
  -Dstatic-libraries=OFF \
  -DCMAKE_INSTALL_PREFIX:PATH=$HOME/nest-2.18.0-install \
  ..

make -j
make install

cd $CDIR
