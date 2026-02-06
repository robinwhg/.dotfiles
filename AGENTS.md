# AGENTS.md - Dotfiles Repository Guide

This is a personal dotfiles repository managed with GNU Stow. It contains configurations for fish shell, tmux, neovim, lazygit, yazi, and other development tools.

## Repository Structure

```
.
├── fish/.config/fish/      # Fish shell config and functions
├── nvim/.config/nvim/      # Neovim (LazyVim-based) config
├── tmux/.tmux.conf         # Tmux configuration
├── git/.gitconfig          # Git configuration
├── yazi/.config/yazi/      # Yazi file manager config
├── lazygit/                # Lazygit configuration
├── opencode/               # Opencode AI config
├── zed/                    # Zed editor config
├── ghostty/                # Ghostty terminal config
├── zsh/                    # Zsh configuration
└── README.md
```

## Build/Deploy Commands

This repository uses GNU Stow for symlink management:

```bash
# Deploy a specific configuration
stow fish
stow nvim
stow tmux

# Deploy all configurations
stow */

# Remove/unstow a configuration
stow -D fish
```

**Note:** There are no traditional build, lint, or test commands. This is a configuration-only repository.

## Code Style Guidelines

### Fish Shell

- **Indentation:** 4 spaces
- **Variables:**
  - Use `set -l` for local variables
  - Use `set -g` for global variables  
  - Use `set -x` for exported/environment variables
  - Use `set -U` for universal variables (user settings)
- **Functions:**
  ```fish
  function function_name --description "Clear description"
      # body
  end
  ```
- **Conditionals:** Use `test` command
  ```fish
  if test (count $argv) -ge 1
      # handle args
  end
  ```
- **Error handling:** Return error codes with `return 1`
- **Quotes:** Double quotes for strings with variables, single quotes for literals
- **Comments:** Use `#` for comments, prefer clear descriptions over obvious comments

### Lua (Neovim)

- **Indentation:** 2 spaces
- **Quotes:** Double quotes for strings
- **Table format:** Return tables at end of file
  ```lua
  return {
    "plugin/name",
    opts = {
      key = value,
    },
  }
  ```
- **LazyVim conventions:** Follow LazyVim plugin structure (opts, config, keys, etc.)
- **Local variables:** Use `local` keyword
- **Line length:** Keep under 100 characters where practical

### Tmux

- **Indentation:** Align related options
  ```
  set  -g   option value
  setw -g   option value
  bind    -T prefix key command
  bind -r -T prefix key command
  ```
- **Comments:** Group related settings with section headers
- **Key bindings:** Prefix with descriptive comments

### Git Commit Style

Use conventional commits:
- `feat(scope): description` - New features
- `fix(scope): description` - Bug fixes  
- `refactor(scope): description` - Code refactoring
- `docs(scope): description` - Documentation changes
- `chore(scope): description` - Maintenance tasks

**Scopes:** `fish`, `nvim`, `tmux`, `git`, `yazi`, etc.

## Naming Conventions

- **Functions:** snake_case (fish: `dev`, lua: opts/config functions)
- **Variables:** snake_case
- **Files:** kebab-case for multi-word files
- **Aliases:** Short, memorable abbreviations (`nv`, `lg`, `tm`)

## Error Handling

- Fish: Check directory/file existence before operations
  ```fish
  if not test -d "$target_dir"
      echo "Error: '$argv[1]' is not a valid directory"
      return 1
  end
  ```
- Validate user input when accepting arguments

## Key Patterns

1. **Dev workflow:** `dev [path]` function creates tmux sessions with nvim, opencode, yazi windows
2. **Vi mode:** Both fish and tmux use vi key bindings
3. **Theme:** Tokyonight Moon color scheme across tools
4. **Paths:** Use `realpath` for path normalization in fish
5. **Tmux sessions:** Named after directory basename

## File Locations

- Fish functions: `fish/.config/fish/functions/`
- Fish config: `fish/.config/fish/config.fish`
- Nvim plugins: `nvim/.config/nvim/lua/plugins/`
- Nvim config: `nvim/.config/nvim/lua/config/`
- Tmux: `tmux/.tmux.conf`

## Important Notes

- Always validate paths exist before creating symlinks with stow
- Fish universal variables (`set -U`) persist across sessions
- Tmux config requires prefix key (C-a) reload: `C-a C-r`
- Use `fzf` integration for shell completions
