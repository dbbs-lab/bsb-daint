source $HOME/bsb-daint/load.sh
export STORE="/store/$PROJECT/$ACCOUNT"
export PATH="$STORE/blender:$PATH"
export DISPLAY=:0
alias queue="squeue -u $USER"
alias maa='module avail 2>&1 |grep -i'
alias debug="srun -C mc -p debug -A $ACCOUNT $@"
alias bsb-reconfigure="srun -C mc -p debug -A $ACCOUNT bsb -v=3 reconfigure $@"
alias bsb-update="_dir=$PWD && cd $HOME/bsb-daint && git pull && source install.sh $ACCOUNT && cd $_dir"
