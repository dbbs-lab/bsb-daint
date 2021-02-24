alias queue="squeue -u $ACCOUNT"
alias maa='module avail 2>&1 |grep -i'
alias debug="srun -C mc -p debug -A $PROJECT $@"
alias bsb-reconfigure="srun -C mc -p debug -A $PROJECT bsb -v=3 reconfigure $@"
alias bsb-update="_dir=$PWD && cd $HOME/bsb-daint && git pull && source install.sh $PROJECT && cd $_dir"
alias blender="$SCRATCH/blender/blender $@"
