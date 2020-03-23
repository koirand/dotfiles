rmdir:
	rm -rf ~/.vim
	rm -rf ~/.config/fish
	rm -rf ~/.config/karabiner

install: rmdir
	# git
	ln -snf ~/dotfiles/.gitconfig ~/.gitconfig
	ln -snf ~/dotfiles/.gitignore_global ~/.gitignore_global
	# tmux
	ln -snf ~/dotfiles/.tmux.conf ~/.tmux.conf
	# vim
	ln -snf ~/dotfiles/.vim ~/.vim
	ln -snf ~/dotfiles/.vimrc ~/.vimrc
	# fish
	mkdir -p ~/.config
	ln -snf ~/dotfiles/.config/fish ~/.config/fish
ifeq ($(shell uname),Darwin)
	# VSCode
	mkdir -p ~/Library/Application\ Support/Code/User/
	ln -snf ~/dotfiles/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	# Brew
	ln -snf ~/dotfiles/.Brewfile ~/.Brewfile
	ln -snf ~/dotfiles/.Brewfile.lock.json ~/.Brewfile.lock.json
	# karabiner
	ln -snf ~/dotfiles/.config/karabiner ~/.config/karabiner
endif
