tmux has-session -t $1
if [ $? != 0 ]
then
  tmux new-session -d -s $1
fi
tmux move-window -t $1:
