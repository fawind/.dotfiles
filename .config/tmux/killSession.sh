CURRENT_SESSION=$(tmux display-message -p '#S');
OPEN_SESSIONS=$(tmux ls | cut -d ":" -f 1 | wc -l);

if [ $OPEN_SESSIONS -gt 1 ]; then
        tmux switch-client -n;
        tmux kill-session -t=${CURRENT_SESSION};
        tmux refresh-client -S
fi
