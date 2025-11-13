# . "$HOME/.local/share/../bin/env"

HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
  source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER";
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

export NVM_LAZY_LOAD=true # Lazy loading nvm for better performance

# ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light lukechilds/zsh-nvm

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::npm
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keybinding
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='eza'
alias ll='eza -a -l'
alias lsa='eza -a'
alias lta='eza -a -T'
alias cl='clear'
alias vim='nvim'
alias lg='lazygit'
alias cbon='cbonsai -i -l'
alias neo='neo -a -D -m=Ghorbany.DEV -s' # Only works on macos after installing https://github.com/st3w/neo
# alias neo='neo-matrix -D -m "Ghorbany.DEV"' # Only works on linux after instaling the neo-matrix

# Shell integrations
source <(fzf --zsh)

# EZA - Setting the config path (macos only)
export EZA_CONFIG_DIR=~/.config/eza

# Zoxide integration
eval "$(zoxide init --cmd cd zsh)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config "~/.config/ohmyposh/themes/zen.toml")"
fi

zstyle ':fzf-tab:*' use-fzf-default-opts yes

# FZF customize
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,bg:-1,hl:#82aaff
  --color=fg+:#c8d3f5,bg+:#2a2e48,hl+:#82aaff
  --color=info:#444a73,prompt:#82aaff,pointer:#ff757f 
  --color=marker:#ffc777,spinner:#ffc777,header:#ffc777
  --border="rounded" --border-label="" --preview-window="border-rounded" --padding="1"
  --margin="1" --prompt="🤖 " --marker="> " --pointer="◆"
  --separator="─" --scrollbar="│" --layout="reverse"'
