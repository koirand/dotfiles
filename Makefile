# このMakefile自身が置かれているディレクトリ。
# リポジトリをどこに置いても動くよう、パスを固定しない。
DOTFILES := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

rmdir:
	rm -rf ~/.vim
	rm -rf ~/.config/karabiner

install: rmdir
	# git
	ln -snf $(DOTFILES)/.gitconfig ~/.gitconfig
	ln -snf $(DOTFILES)/.gitignore_global ~/.gitignore_global
	# vim
	ln -snf $(DOTFILES)/.vim ~/.vim
	ln -snf $(DOTFILES)/.vimrc ~/.vimrc
	# zsh
	ln -snf $(DOTFILES)/.zshrc ~/.zshrc
	# nix
	mkdir -p ~/.config/nix
	ln -snf $(DOTFILES)/.config/nix/nix.conf ~/.config/nix/nix.conf
	# direnv
	mkdir -p ~/.config/direnv
	ln -snf $(DOTFILES)/.config/direnv/direnvrc ~/.config/direnv/direnvrc
ifeq ($(shell uname),Darwin)
	# Brew
	ln -snf $(DOTFILES)/.Brewfile ~/.Brewfile
	# karabiner
	mkdir -p ~/.config
	ln -snf $(DOTFILES)/.config/karabiner ~/.config/karabiner
endif
