module load daint-mc
module swap PrgEnv-cray PrgEnv-gnu
module load PyExtensions

export CRAYPE_LINK_TYPE=dynamic 

cd
wget -P $HOME "https://zenodo.org/record/2605422/files/nest-simulator-2.18.0.tar.gz"
tar -xzf nest-simulator-2.18.0.tar.gz
rm -rf nest-2.18.0-install/
mkdir nest-2.18.0-install/
cd nest-2.18.0-install

cmake -Dwith-mpi=ON -Dwith-python=3 -DPYTHON_EXECUTABLE=/opt/python/3.8.2.1/bin/python -DCMAKE_CXX_COMPILER=CC -DCMAKE_C_COMPILER=cc -Dstatic-libraries=OFF -DCMAKE_INSTALL_PREFIX:PATH=$HOME/nest-2.18.0-install $HOME/nest-simulator-2.18.0/
make
make install
