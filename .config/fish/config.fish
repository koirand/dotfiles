# Fhsher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# short alias
alias c="docker-compose"
alias d="docker"
alias g="git"
alias k="kubectl"
alias y="yarn"

# cheetsheet
alias cs="vim ~/Projects/cheetsheet/cheet-sheet.md"

# memo
alias memo="vim + ~/Documents/memo.txt"

# MacOS
alias launchpad-reset="defaults write com.apple.dock ResetLaunchPad -bool true;killall Dock"

# go
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
set -gx GO111MODULE on
