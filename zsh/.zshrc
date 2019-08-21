# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stream/.zshrc'

autoload -Uz compinit
# TODO: Figure out why prompted at startup.
# compinit
# End of lines added by compinstall

# --- User Config ---

# ZSH History.
## Up arrow match history.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
## Extra history config.
setopt    sharehistory      # Share history across terminals
setopt    incappendhistory  # Immediately append to the history file, not just when a term is killed

# Env vars.
source ~/.zsh_env.sh

# Aliases.
source ~/.zsh_alias.sh

# tmux.
source ~/.zsh_tmux.sh

# Theme.
source ~/.zsh_theme.sh
