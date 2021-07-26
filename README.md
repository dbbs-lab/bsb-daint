# bsb-daint
Tools &amp; scripts for running scaffold models on Piz Daint

# Installation

Clone this repository into your home folder:

    cd ~
    git clone https://github.com/dbbs-lab/bsb-daint

Add the following to `~/.bashrc`:

```
export PROJECT="my_project"
export ACCOUNT="my_account"
source ~/bsb-daint/shell.sh
```

**Note:** Replace `PROJECT` and `ACCOUNT` with the correct information.

Install the scaffold stack into your shared project directory:

    source ~/bsb-daint/install.sh
    
You can also opt to install it elsewhere, like in your user directory:

    source ~/bsb-daint/install.sh $HOME

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

## Shell commands

If you followed the installation instruction for the shell shortcuts you'll have
access to the following commands:

### `bsb-update`

Updates the `bsb-daint` to the latest version and performs an installation of the
BSB, its dependencies and compiles your mod files.

### `bsb-reconfigure`

Executes `bsb reconfigure $1 $2` as a job.

### `debug`

Runs whatever follows `debug` as a job in debug mode. For example `debug python
-c "print('Hello, world!')"`.

### `queue`

Checks your job queue

### `maa`

Checks which modules are available and contain the search term

    $> maa python
    adept-utils/606ebad-CrayGNU-20.08-python3
    dyninst/10.2.0-CrayGNU-20.08-python3
    gprof2dot/2019.11.30-python3(default)
    pudb/2019.2-CrayGNU-20.08-python3(default)
    scorep_binding_python/3.0-CrayGNU-20.08-python3(default)
    termgraph/0.4.2-python3(default)
    Boost/1.70.0-CrayGNU-20.08-python3(default)
    ParaView/5.8.1-CrayGNU-20.08-OSMesa-python3(default)
    ParaView/5.9.0-CrayGNU-20.08-OSMesa-python3
    PyExtensions/python3-CrayGNU-20.08
    cftime/1.0.2.1-CrayGNU-20.08-python3
    dask/2.2.0-CrayGNU-20.08-python3(default)
    h5py/2.10.0-CrayGNU-20.08-python3-parallel(default)
    h5py/2.10.0-CrayGNU-20.08-python3-serial
    netcdf-python/1.4.1-CrayGNU-20.08-python3
    netcdf-python/1.5.4-CrayGNU-20.08-python3(default)
    python_virtualenv/15.0.3
    cray-python/3.8.2.1(default)
