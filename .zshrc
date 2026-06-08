# Set the directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"

# Download zinit, if it's not already installed
if [[ ! -d $ZINIT_HOME ]]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

# Load zinit
source "$ZINIT_HOME/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::kitty

# Load plugins
autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -v

# Vim keybindings for history search forwards/backwards
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^Y' accept-line

#History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_dups
setopt hist_ignore_space

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias cd='z'
alias ..='cd ..'
alias ~='cd ~'

# Shell integrations
eval "$(zoxide init zsh)"

export PATH="$PATH:/home/nathan/go/bin:/home/nathan/.local/bin"
export CROUTON=1
export _ZO_DOCTOR=0

# Override Fedora's nano-default-editor (/etc/profile.d/nano-default-editor.sh)
export EDITOR=nvim
export VISUAL=nvim

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
# eval "$(starship init zsh)"  # replaced by pure zsh prompt below

# -- Prompt --
setopt prompt_subst

function _git_info() {
  local head gitdir ref
  if [[ -f .git/HEAD ]]; then
    head=$(<.git/HEAD)
  elif [[ -f .git ]]; then
    gitdir=${$(<.git)#gitdir: }
    gitdir=${gitdir%%$'\n'*}
    head=$(<"$gitdir/HEAD")
  fi
  ref=${head##*refs/heads/}
  [[ -z $ref || $ref == "$head" ]] && return
  print -n " %F{#ca9ee6}$ref%f"
}

function _prompt() {
  local dir="%B%F{#81c8be}%(4~|…/%2~|%~)%f%b"
  local host
  [[ -z $CROUTON ]] && host="%F{#737994} %m%f"
  local arrow="%(?.%F{#a6d189}.%F{#e78284})❯%f"
  PROMPT=$'\n'"$dir\$(_git_info)$host $arrow "
}

precmd_functions+=(_prompt)
