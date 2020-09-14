# bsb-daint
Tools &amp; scripts for running scaffold models on Piz Daint

# Installation

Clone this repository into your home folder:

    cd ~
    git clone https://github.com/dbbs-lab/bsb-daint

To install the scaffold stack into your user directory use the `install` helper script:

    source ~/bsb-daint/install.sh

# Usage

In your SLURM job script use the `load` helper script:

```
#!/bin/bash -l
#SBATCH --job-name="hello_world"

# ...

source ~/bsb-daint/load.sh
srun bsb simulate my_simulation --hdf5=my_network_file.hdf5
```

**Note:** Always prepend `srun` to the BSB commands for correct initialisation of MPI and
parallelisation of the scaffold. E.g. `srun bsb simulate poc --hdf5=netw.hdf5`.

**Note:** Do not use `bsb compile` on multiple nodes as it cannot run in parallel and will
just duplicate the process n times.
