if [ -z "$TMUX" ]; then
    tmux attach -d || tmux new -t stream
fi
