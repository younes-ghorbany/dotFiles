#   ____ _   _ 
#  / ___| | | |   Younes Ghorbany 
# | |  _| |_| |   https://ghorbany.dev
# | |_| |  _  |   https://github.com/younes.ghorbany
#  \____|_| |_|   https://youtube.com/@younes.ghorbany
#
# My zsh config. Not much to see here; just some pretty standard stuff.

# ============================================================================= #
#                                   EXPORTS                                     #
# ============================================================================= #

export NVM_LAZY_LOAD=true                              # Lazy loading nvm for better performance
export EZA_CONFIG_DIR=~/.config/eza                    # EZA config (macOS only)
export PATH=/home/uns/.opencode/bin:$PATH              # OpenCode

# FZF customization
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,bg:-1,hl:#82aaff
  --color=fg+:#c8d3f5,bg+:#2a2e48,hl+:#82aaff
  --color=info:#444a73,prompt:#82aaff,pointer:#ff757f 
  --color=marker:#ffc777,spinner:#ffc777,header:#ffc777
  --border="rounded" --border-label="" --preview-window="border-rounded" --padding="1"
  --margin="1" --prompt="🤖 " --marker="> " --pointer="◆"
  --separator="─" --scrollbar="│" --layout="reverse"'

# ============================================================================= #
#                           PLATFORM-SPECIFIC SETUP                             #
# ============================================================================= #

# Homebrew command not found handler (macOS only)
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
  HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
  if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
    source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER"
  fi
fi

# ============================================================================= #
#                           ZINIT PLUGIN MANAGER                                #
# ============================================================================= #

# Install Zinit if not present
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

# ============================================================================= #
#                                   TMUX                                        #
# ============================================================================= #

# Custom tmux function - creates session with predefined windows if not already running
t() {
  if [ -z "$TMUX" ]; then
    if ! command tmux has-session -t "GhorbanyDEV" 2>/dev/null; then
      command tmux new-session -d -s "GhorbanyDEV" -n Terminal
      command tmux new-window -n Coding
      command tmux new-window -n Playground
      command tmux new-window -n Email
      command tmux new-window -n AI
      command tmux new-window -n "Teaching Terminal"
      command tmux new-window -n "Teaching Coding"
    fi
    command tmux select-window -t "GhorbanyDEV":1
    command tmux attach-session -t "GhorbanyDEV"
  else
    command tmux "$@"
  fi
}

# ============================================================================= #
#                                 ZSH PLUGINS                                   #
# ============================================================================= #

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light lukechilds/zsh-nvm

# Built-in plugin snippets
zinit snippet OMZP::git
zinit snippet OMZP::npm
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# ============================================================================= #
#                                  KEYBINDINGS                                  #
# ============================================================================= #

bindkey -e                    # Emacs-style keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ============================================================================= #
#                                HISTORY SETTINGS                               #
# ============================================================================= #

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

# ============================================================================= # 
#                               COMPLETION STYLING                              #
# ============================================================================= #

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# ============================================================================= #
#                                   ALIASES                                     #
# ============================================================================= #

# Basic aliases
alias ls='eza'
alias ll='eza -a -l'
alias lsa='eza -a'
alias lta='eza -a -T'
alias cl='clear'

# Zsh config 
alias zc='nvim ~/.zshrc'

# Cargo/Rust aliases
alias cr='cargo run --quiet'
alias cb='cargo build'
alias cbr='cargo build --release'
alias cc='cargo check'
alias cu='cargo update'
alias rd='rustup doc --std'

# Editor aliases
alias vim='nvim'

# Git tools
alias lg='lazygit'

# Fun aliases
alias cbon='cbonsai -i -l'

# pacman and yay aliases
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias orphan='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphaned packages (DANGEROUS!)

# Mirror list helpers
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Neo matrix alias (different for each platform)
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
  alias neo='neo -a -D -m=Ghorbany.DEV -s' # Only works on macos
else 
  alias neo='neo-matrix -D -m "Ghorbany.DEV"' # Only works on linux
fi

# Utility flags
alias df='df -h'               # human-readable sizes
alias free='free -m'           # show sizes in MB
alias grep='grep --color=auto' # colorize output

# TTY fonts
alias bigfont="setfont ter-132b"
alias regfont="setfont default8x16"

# ============================================================================= #
#                               SHELL INTEGRATIONS                              #
# ============================================================================= #

# FZF shell integration
source <(fzf --zsh)

# Zoxide integration (cd replacement)
eval "$(zoxide init --cmd cd zsh)"

# Oh My Posh prompt (not on Apple Terminal)
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config "~/.config/ohmyposh/themes/zen.toml")"
fi

# ============================================================================= #
#                                   STARTUP                                     #
# ============================================================================= #

# Random color script for terminal aesthetics
colorscript random
