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
alias kc="kubectx | peco | xargs kubectx"

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
# peco
# ---------------------------------------------------------------------------
peco-history() {
    local cmd
    cmd=$(fc -rl -n 1 | awk '!a[$0]++' | peco --query "$LBUFFER")
    if [ -n "$cmd" ]; then
        BUFFER="$cmd"
        CURSOR=$#BUFFER
    fi
    zle reset-prompt
}
zle -N peco-history
bindkey '^r' peco-history

peco-git() {
    local selected_dir
    selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $selected_dir"
        zle accept-line
    fi
    zle reset-prompt
}
zle -N peco-git
bindkey '^g' peco-git

peco-worktree() {
    local selected_dir
    selected_dir=$(git worktree list | awk '{print $1}' | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $selected_dir"
        zle accept-line
    fi
    zle reset-prompt
}
zle -N peco-worktree
bindkey '^t' peco-worktree

# ---------------------------------------------------------------------------
# plugins (must be loaded at the end)
# ---------------------------------------------------------------------------
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
