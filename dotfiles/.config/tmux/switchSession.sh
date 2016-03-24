tmux has-session -t=$1
if [ $? != 0 ]
then
  TMUX= tmux new-session -d -s $1
fi
tmux switch-client -t=$1
tmux refresh-client -S
