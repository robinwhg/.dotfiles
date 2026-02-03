function dev --description "Create a tmux dev session named after the current directory"
    set -l session_name (basename (pwd))

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null
        # Switch or attach to existing session
        if set -q TMUX
            tmux switch-client -t "$session_name"
        else
            tmux attach-session -t "$session_name"
        end
        return
    end

    # Create new session with first window (shell)
    tmux new-session -d -s "$session_name" -n shell

    # Create window for neovim
    tmux new-window -t "$session_name" -n nvim
    tmux send-keys -t "$session_name:nvim" "nvim" Enter

    # Create window for opencode
    tmux new-window -t "$session_name" -n opencode
    tmux send-keys -t "$session_name:opencode" "opencode" Enter

    # Create window for lazygit
    tmux new-window -t "$session_name" -n lazygit
    tmux send-keys -t "$session_name:lazygit" "lazygit" Enter

    # Create window for yazi
    tmux new-window -t "$session_name" -n yazi
    tmux send-keys -t "$session_name:yazi" "yazi" Enter

    # Select the first window (shell)
    tmux select-window -t "$session_name:shell"

    # Switch or attach to the session
    if set -q TMUX
        tmux switch-client -t "$session_name"
    else
        tmux attach-session -t "$session_name"
    end
end
