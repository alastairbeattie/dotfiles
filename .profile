# allow per-user 'global' npm installs
PATH="$HOME/.node_modules/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix=~/.node_modules
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
