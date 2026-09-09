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
	# nix
	mkdir -p ~/.config/nix
	ln -snf ~/dotfiles/.config/nix/nix.conf ~/.config/nix/nix.conf
	# direnv
	mkdir -p ~/.config/direnv
	ln -snf ~/dotfiles/.config/direnv/direnvrc ~/.config/direnv/direnvrc
ifeq ($(shell uname),Darwin)
	# Brew
	ln -snf ~/dotfiles/.Brewfile ~/.Brewfile
	# karabiner
	mkdir -p ~/.config
	ln -snf ~/dotfiles/.config/karabiner ~/.config/karabiner
endif
