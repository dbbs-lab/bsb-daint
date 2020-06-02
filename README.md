# scaffold-daint
Tools &amp; script for running scaffold models on Piz Daint

# Installation

Clone this repository into your home folder:

    cd ~
    git clone https://github.com/dbbs-lab/scaffold-daint

To install the scaffold stack into your user directory use the `install` helper script:

    source ~/scaffold-daint/helpers/scaffold-install.sh

# Usage

In your SLURM job script use the `load` helper script:

```
#!/bin/bash -l
#SBATCH --job-name="hello_world"

# ...

source ~/scaffold-daint/helpers/scaffold-load.sh
srun scaffold simulate my_simulation --hdf5=my_network_file.hdf5
