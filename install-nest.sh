# Bash sourcefile dir snippet from https://stackoverflow.com/a/246128/1016004
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

source $DIR/helpers/modules.sh
export CRAYPE_LINK_TYPE=dynamic

CDIR=$PWD
cd
rm -rf nest-simulator
git clone https://github.com/dbbs-lab/nest-simulator.git --depth 1
cd nest-simulator
mkdir build
cd build
rm -rf nest-2.18.0-install/

cmake \
  -Dwith-mpi=ON \
  -Dwith-python=3 \
  -DPYTHON_EXECUTABLE=/opt/python/3.8.2.1/bin/python \
  -DPYTHON_LIBRARY=/opt/python/3.8.2.1/lib/libpython3.8.so \
  -DPYTHON_INCLUDE_DIR=/opt/python/3.8.2.1/include/python3.8 \
  -DCMAKE_CXX_COMPILER=CC \
  -DCMAKE_C_COMPILER=cc \
  -Dstatic-libraries=OFF \
  -DCMAKE_INSTALL_PREFIX:PATH=$HOME/nest-2.18.0-install \
  ..

make -j
make install

cd $CDIR
