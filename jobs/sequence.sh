#!/bin/bash -l
#SBATCH --job-name="Blender sequencing"
#SBATCH --mail-type=ALL
#SBATCH --time=05:45:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=normal
#SBATCH --constraint=mc&startx
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun blender -b $1 -E CYCLES -P $HOME/bsb-daint/blender/sequence.py -- $2

