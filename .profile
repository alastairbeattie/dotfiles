# allow per-user 'global' npm installs

# path for node modules
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# path for pip --user libraries
PATH="$HOME/.local/bin:$PATH"
#xcape -e 'Control_L=Escape'

#### ALIASES ####
# alias for dotfiles repository
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
