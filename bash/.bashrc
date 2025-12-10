case $- in
*i*) ;;
*) return ;;
esac

if [ -z "$TMUX" ]; then
  tmux new-session -A -s main
fi
