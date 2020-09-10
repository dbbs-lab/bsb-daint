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

# Clone nrn repo
git clone https://github.com/neuronsimulator/nrn ~/nrn

# Run CMake & install
CDIR=$PWD
mkdir ~/nrn/build
cd ~/nrn/build
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$HOME/nrn-install \
  -DNRN_ENABLE_CORENEURON=OFF \
  -DNRN_ENABLE_INTERVIEWS=OFF

make -j
make install

# Restore state
cd $CDIR
