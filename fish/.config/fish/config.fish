set -U EDITOR nvim
set -U VISUAL nvim

set -x PATH $PATH ~/.cargo/bin /usr/local/go/bin ~/.local/share/pnpm

alias ll="ls -l"
alias la="ls -la"
alias tm="tmux new-session -A -s main"
alias nv="nvim"
alias lg="lazygit"

# Set up fzf key bindings
fzf --fish | source

if status is-interactive
    set -g fish_greeting ''
    source ~/.config/fish/themes/tokyonight_moon.fish

    set -g fish_key_bindings fish_vi_key_bindings
    bind -M insert -m default j,k cancel repaint-mode
    set -g fish_sequence_key_delay_ms 200
end

# opencode
fish_add_path /home/robinwhg/.opencode/bin
