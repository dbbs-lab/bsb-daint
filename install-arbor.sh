pip install --upgrade pip
pip install cmake       # feels dirty, but it works
pip install numpy

# get arbor source
git clone git@github.com:arbor-sim/arbor.git --recursive

# configure
mkdir build
cd build
CC=cc CXX=CC cmake ../arbor -DARB_USE_BUNDLED_LIBS=on -DARB_VECTORIZE=on -DARB_WITH_PYTHON=on -DARB_WITH_MPI=on -DCMAKE_INSTALL_PREFIX=$HOME/.local

# make and install
make install -j12

# test
python -c 'import arbor; print(arbor.config())'
