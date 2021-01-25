# Fhsher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# short alias
alias d="docker"
alias dc="docker-compose"
alias g="git"
alias k="kubectl"
alias y="yarn"
alias t="terraform"

# cheetsheet
alias cs="vim ~/Documents/cheetsheet/cheet-sheet.md"

# memo
alias memo="vim + ~/Documents/memo.txt"

# MacOS
alias launchpad-reset="defaults write com.apple.dock ResetLaunchPad -bool true;killall Dock"

# kubectx
alias kc="kubectx | peco | xargs kubectx"

# nodebrew
# set -gx PATH $HOME/.nodebrew/current/bin $PATH
# go
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
set -gx GO111MODULE on

# oh-my-fish/plugin-peco
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

# decors/fish-ghq
set GHQ_SELECTOR peco

