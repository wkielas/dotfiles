autoload -U compinit promptinit
compinit -i
promptinit

autoload -U colors
colors

setopt PROMPT_SUBST
setopt extended_glob
setopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_cd
setopt auto_pushd
setopt nohup
setopt correct
setopt pushd_ignore_dups
setopt hist_ignore_dups
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt histverify
setopt APPEND_HISTORY
setopt menucomplete
zstyle ':completion:*' menu select=long-list select=3

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

function compact_pwd {
  pwd | perl -pe 's/$ENV{HOME}/~/;s/([^\/])[^\/]+\//$1\//g;s/\n//'
}

source /etc/profile.d/99-iotkit.sh

if [[ `whoami` == "root" ]]
then
  PROMPT='%* %{$fg[red]%}(%{$reset_color%}%?%{$fg[red]%})%{$reset_color%} $IOTKIT_HOSTNAME $(compact_pwd) (%{$fg[red]%}$IOTKIT_ENV%{$reset_color%}) %{$fg[red]%}#%{$reset_color%} '
else
  PROMPT='%* %{$fg[green]%}(%{$reset_color%}%?%{$fg[green]%})%{$reset_color%} $IOTKIT_HOSTNAME $(compact_pwd) (%{$fg[green]%}$IOTKIT_ENV%{$reset_color%}) %{$fg[green]%}%%%{$reset_color%} '
fi

#v vi bind
autoload -U edit-command-line 
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

bindkey -v

alias sudoi='sudo -s /bin/zsh -i'

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PERL_BADLANG=0

bindkey '^R' history-incremental-search-backward
