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

# Install dbbs scaffold package
python -m pip install --user bsb[NEURON,MPI]==3.7.4 NEURON==7.8.1.1
# Compile glia prerequisites
srun -A $ACCOUNT -C mc -p debug glia compile
# Install Blender
if [ -d "$STORE/blender" ]; then
  echo "Blender already installed in $STORE."
else
  wget https://download.blender.org/release/Blender2.91/blender-2.91.0-linux64.tar.xz
  tar -xf blender-2.91.0-linux64.tar.xz
  mv blender-2.91.0-linux64.tar.xz $STORE/blender
  rm blender-2.91.0-linux64.tar.xz
  # Install latest Neuro3D into Blender
  curl -Ls https://github.com/Helveg/neuro3d/releases/latest/download/install | python
  # Fix missing `setuptools` due to environment error
  $STORE/blender/2.91/python/bin/python3.7m -m pip install --ignore-installed --prefix=$STORE/blender/2.91/python setuptools
fi
