# Bash sourcefile dir snippet from https://stackoverflow.com/a/246128/1016004
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

source $DIR/../helpers/modules.sh
module load gcc/9.3.0
module switch PrgEnv-cray PrgEnv-gnu
source $DIR/../helpers/activate-env.sh
source $DIR/mpi4py.sh

CDIR=$PWD
cd $HOME/bsb-env
rm -rf repos/arbor
git clone --branch pizdaint git@github.com:Helveg/arbor repos/arbor --recursive
mkdir repos/arbor/build
cd repos/arbor/build
CC=cc CXX=CC cmake .. \
  -DARB_WITH_MPI=ON \
  -DARB_WITH_PROFILING=OFF \
  -DARB_GPU=cuda \
  -DARB_USE_BUNDLED_LIBS=ON \
  -DARB_WITH_PYTHON=ON \
  -DARB_VECTORIZE=ON \
  -DCMAKE_INSTALL_PREFIX=$HOME/bsb-env
make install -j 8
python -c "import arbor; arbor.config()"
source $DIR/helpers/deactivate-env.sh
cd $CDIR
