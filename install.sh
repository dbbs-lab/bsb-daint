# Bash sourcefile dir snippet from https://stackoverflow.com/a/246128/1016004
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

source $DIR/helpers/modules.sh

ACC=${1:-$ACCOUNT}
if [ -z $ACC ]; then
        echo "Either set \$ACCOUNT or pass the account to use as first arg to the command."
	return 1
fi

# Install dbbs scaffold package
python -m pip install --user bsb[NEURON,MPI]==3.6.7 NEURON==7.8.1.1

source $DIR/load.sh
srun -A $ACC -C mc -p debug glia compile
