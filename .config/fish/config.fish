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

# homebrew
set -gx PATH /opt/homebrew/bin $PATH

# node
set -gx PATH /opt/homebrew/opt/node@20/bin $PATH
set -gx LDFLAGS "-L/opt/homebrew/opt/node@20/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/node@20/include"

# cheetsheet
alias cs="vim ~/src/github.com/koirand/cheetsheet/cheet-sheet.md"

# memo
alias memo="vim + ~/Documents/memo.txt"

# MacOS
alias launchpad-reset="defaults write com.apple.dock ResetLaunchPad -bool true;killall Dock"

# kubectx
alias kc="kubectx | peco | xargs kubectx"

# go
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
set -gx GO111MODULE on

# uv
if type -q uv
  uv generate-shell-completion fish | source
end

# peco
function peco-history
    set cmd (history | peco --query (commandline -b))
    if test -n "$cmd"
        commandline -r "$cmd"
    end
end
bind \cr 'peco-history'

function peco-git
    set selected_dir (ghq list --full-path | peco --query (commandline -b))
    if test -n "$selected_dir"
        commandline -r "cd $selected_dir"
        commandline -f execute
    end
end
bind \cg 'peco-git'
