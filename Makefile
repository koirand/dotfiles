rmdir:
	rm -rf ~/.vim
	rm -rf ~/.config/fish

install: rmdir
	ln -snf ~/dotfiles/.gitconfig ~/.gitconfig
	ln -snf ~/dotfiles/.gitignore_global ~/.gitignore_global
	ln -snf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -snf ~/dotfiles/.vim ~/.vim
	ln -snf ~/dotfiles/.vimrc ~/.vimrc
	mkdir -p ~/.config
	ln -snf ~/dotfiles/.config/fish ~/.config/fish
ifeq ($(shell uname),Darwin)
	# VSCode
	mkdir -p ~/Library/Application\ Support/Code/User/
	ln -snf ~/dotfiles/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	# Brew
	ln -snf ~/dotfiles/.Brewfile ~/.Brewfile
	ln -snf ~/dotfiles/.Brewfile.lock.json ~/.Brewfile.lock.json
endif
