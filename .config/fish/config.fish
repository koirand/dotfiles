# node.js
set -gx PATH $HOME/.nodebrew/current/bin $PATH

# golang
set -x -U GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# java
set -x -U JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home"
set -gx PATH $JAVA_HOME $PATH

# alias
alias cs="vim ~/Projects/cheetsheet/cheet-sheet.md"
