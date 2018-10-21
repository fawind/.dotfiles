tmux select-window -t=$1 || tmux new-window -t=$1 -c "#{pane_current_path}"
