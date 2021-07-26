#!/bin/bash -l
#SBATCH --account=$ACCOUNT
#SBATCH --mail-type=ALL
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=36
#SBATCH --cpus-per-task=1
#SBATCH --partition=normal
#SBATCH --constraint=mc
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

source $HOME/bsb-daint/load.sh
sim=$1
netw=$2
srun bsb -v 3 simulate $sim --hdf5=$netw
