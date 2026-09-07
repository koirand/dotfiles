rmdir:
	rm -rf ~/.vim
	rm -rf ~/.config/karabiner

install: rmdir
	# git
	ln -snf ~/dotfiles/.gitconfig ~/.gitconfig
	ln -snf ~/dotfiles/.gitignore_global ~/.gitignore_global
	# vim
	ln -snf ~/dotfiles/.vim ~/.vim
	ln -snf ~/dotfiles/.vimrc ~/.vimrc
	# zsh
	ln -snf ~/dotfiles/.zshrc ~/.zshrc
ifeq ($(shell uname),Darwin)
	# Brew
	ln -snf ~/dotfiles/.Brewfile ~/.Brewfile
	# karabiner
	mkdir -p ~/.config
	ln -snf ~/dotfiles/.config/karabiner ~/.config/karabiner
endif
