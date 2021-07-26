#!/bin/bash -l
#SBATCH --account=ich027
#SBATCH --mail-type=ALL
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=36
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=1
#SBATCH --partition=normal
#SBATCH --constraint=mc&startx
#SBATCH --hint=nomultithread
#SBATCH --mem=120G

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

source $HOME/bsb-daint/load.sh
srun python $HOME/bsb-daint/blender/render.py $1
