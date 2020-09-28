module load daint-mc
module unload PrgEnv-gnu/6.0.8
module load PrgEnv-cray/6.0.8
module load PyExtensions/python3-CrayGNU-20.08
module load GSL/2.5-CrayGNU-20.08

export CRAYPE_LINK_TYPE=dynamic

CDIR=$PWD
cd
rm -rf nest-simulator
git clone https://github.com/dbbs-lab/nest-simulator.git --branch 2.18.0 --depth 1
rm -rf nest-2.18.0-install/
mkdir nest-2.18.0-install/
cd nest-2.18.0-install

cmake \
  -Dwith-mpi=ON \
  -Dwith-python=3 \
  -DPYTHON_EXECUTABLE=/opt/python/3.8.2.1/bin/python \
  -DCMAKE_CXX_COMPILER=CC \
  -DCMAKE_C_COMPILER=cc \
  -Dstatic-libraries=OFF \
  -DCMAKE_INSTALL_PREFIX:PATH=$HOME/nest-2.18.0-install \
  $HOME/nest-simulator/
make -j
make install
cd $CDIR
