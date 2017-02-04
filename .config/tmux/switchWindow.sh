tmux new-window -t=$1 -c "#{pane_current_path}" || tmux select-window -t=$1
