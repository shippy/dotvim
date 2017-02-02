My `vim` config files. Initial form taken from @edance; heavy modifications have been done since.

# Install
1. Clone the repo (`git clone --recursive https://github.com/shippy/dotvim.git`) to an arbitrary location.
2. Symlink it to `~/.vim`, or anywhere else your `vim` will look for config files. (You can also clone it into that folder directly.)
3. Run `vim +PluginInstall +PluginClean +qall` to let Vundle load all plugins.
