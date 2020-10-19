# Bash sourcefile dir snippet from https://stackoverflow.com/a/246128/1016004
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

source $DIR/helpers/modules.sh

# Install dbbs scaffold package
python -m pip install --user bsb[NEURON,MPI]==3.6.0b4 NEURON==7.8.1.1

source $DIR/load.sh
srun -C mc -p debug glia compile
