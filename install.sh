#!/bin/bash

RUNDIR=$(dirname $(realpath $0))

runstow() {
   stow -v -d $RUNDIR -t $HOME $@
}

install_bashrc() {
   local BASHRCLINE=$(grep '\.personal\.bash' $HOME/.bashrc)
   if [ -z "$BASHRCLINE" ]; then
      local lineadd='[ -f ~/.personal.bash ] && source ~/.personal.bash'
      echo $lineadd >> $HOME/.bashrc
   fi
}

echo $RUNDIR
runstow bashrc git tig tmux

mkdir -p $HOME/.config
[ -e $RUNDIR/vimrc/.config/nvim/init.vim ] && runstow vimrc

install_bashrc
