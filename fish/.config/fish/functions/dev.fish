function dev --description "Create a tmux dev session named after the current directory"
    # Use provided path or current directory
    set -l target_dir (pwd)
    if test (count $argv) -ge 1
        set target_dir (realpath $argv[1])
        if not test -d "$target_dir"
            echo "Error: '$argv[1]' is not a valid directory"
            return 1
        end
    end

    set -l session_name (basename "$target_dir")

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
    tmux new-session -d -s "$session_name" -n shell -c "$target_dir"

    # Create window for neovim with splits
    tmux new-window -t "$session_name" -n nvim -c "$target_dir"
    tmux send-keys -t "$session_name:nvim" nvim Enter

    # Create window for opencode
    tmux new-window -t "$session_name" -n opencode -c "$target_dir"
    tmux send-keys -t "$session_name:opencode" opencode Enter

    # Create window for lazygit
    tmux new-window -t "$session_name" -n lazygit -c "$target_dir"
    tmux send-keys -t "$session_name:lazygit" lazygit Enter

    # Create window for yazi
    tmux new-window -t "$session_name" -n yazi -c "$target_dir"
    tmux send-keys -t "$session_name:yazi" yazi Enter

    # Select the first window (shell)
    tmux select-window -t "$session_name:shell"

    # Switch or attach to the session
    if set -q TMUX
        tmux switch-client -t "$session_name"
    else
        tmux attach-session -t "$session_name"
    end
end
