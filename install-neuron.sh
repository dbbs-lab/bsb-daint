# Bash sourcefile dir snippet from https://stackoverflow.com/a/246128/1016004
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

source $DIR/helpers/modules.sh
module load PrgEnv-gnu
module swap gcc/8.3.0 gcc/7.3.0

# Clone nrn repo
git clone https://github.com/neuronsimulator/nrn ~/nrn

# Run CMake & install
CDIR=$PWD
mkdir ~/nrn/build
cd ~/nrn/build
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$HOME/nrn-install \
  -DNRN_ENABLE_CORENEURON=OFF

make -j
make install

# Restore state
cd $CDIR
module swap gcc/7.3.0 gcc/8.3.0
