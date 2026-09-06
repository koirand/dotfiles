# ---------------------------------------------------------------------------
# PATH / environment
# ---------------------------------------------------------------------------
# homebrew
export PATH="/opt/homebrew/bin:$PATH"

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=on

# rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# local
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------------------------------------
# alias
# ---------------------------------------------------------------------------
# short alias
alias d="docker"
alias dc="docker-compose"
alias g="git"
alias k="kubectl"
alias y="yarn"
alias t="terraform"

# cheetsheet
alias cs="vim ~/src/github.com/koirand/cheetsheet/cheet-sheet.md"

# memo
alias memo="vim + ~/Documents/memo.txt"
alias todo="vim + ~/Documents/todo.txt"

# MacOS
alias launchpad-reset="defaults write com.apple.dock ResetLaunchPad -bool true;killall Dock"

# kubectx
alias kc="kubectx | fzf | xargs kubectx"

# LibreOffice
alias libreoffice="/Applications/LibreOffice.app/Contents/MacOS/soffice"

# ---------------------------------------------------------------------------
# history
# ---------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt share_history          # share history between sessions
setopt hist_ignore_all_dups   # drop older duplicated commands
setopt hist_ignore_space      # ignore commands starting with a space
setopt hist_reduce_blanks
setopt inc_append_history

# ---------------------------------------------------------------------------
# completion
# ---------------------------------------------------------------------------
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit -C
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case insensitive
zstyle ':completion:*' menu select

# uv
if type uv > /dev/null 2>&1
    then eval "$(uv generate-shell-completion zsh)"
fi

# ---------------------------------------------------------------------------
# prompt (pure)
# ---------------------------------------------------------------------------
autoload -Uz promptinit && promptinit
prompt pure

# ---------------------------------------------------------------------------
# fzf
# ---------------------------------------------------------------------------
export FZF_DEFAULT_OPTS="--height 60% --layout reverse --border --cycle"

# C-r: history / C-t: file / M-c: cd
source <(fzf --zsh)
# C-t is reassigned to fzf-worktree below, so move the file widget out of the way
bindkey '^x^f' fzf-file-widget

fzf-git() {
    local selected_dir
    selected_dir=$(ghq list --full-path | fzf --query "$LBUFFER" \
        --preview '[ -f {}/README.md ] && head -200 {}/README.md || ls -la {}')
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $selected_dir"
        zle accept-line
    fi
    zle reset-prompt
}
zle -N fzf-git
bindkey '^g' fzf-git

fzf-worktree() {
    local selected_dir
    selected_dir=$(git worktree list | fzf --query "$LBUFFER" \
        --preview 'git -C {1} log --oneline --graph --decorate -20' \
        | awk '{print $1}')
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $selected_dir"
        zle accept-line
    fi
    zle reset-prompt
}
zle -N fzf-worktree
bindkey '^t' fzf-worktree

# ---------------------------------------------------------------------------
# plugins (must be loaded at the end)
# ---------------------------------------------------------------------------
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
