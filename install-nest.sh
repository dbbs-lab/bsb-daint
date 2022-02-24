# Bash sourcefile dir snippet from https://stackoverflow.com/a/246128/1016004
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

source $DIR/helpers/modules.sh
source $DIR/load.sh

export CRAYPE_LINK_TYPE=dynamic

CDIR=$PWD
cd
python -m venv nest-env
chmod +x nest-env/bin/activate
nest-env/bin/activate
rm -rf nest-simulator
git clone https://github.com/dbbs-lab/nest-simulator.git --depth 1
cd nest-simulator
mkdir build
cd build

cmake \
  -Dwith-mpi=ON \
  -DCMAKE_CXX_COMPILER=CC \
  -DCMAKE_C_COMPILER=cc \
  -Dstatic-libraries=OFF \
  ..

make -j
make install

cd $CDIR
