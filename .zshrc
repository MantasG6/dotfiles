ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh


HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep

setopt HIST_IGNORE_ALL_DUPS  # Delete old recorded entry if new entry is a duplicate
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks
setopt HIST_IGNORE_SPACE     # Don't record commands starting with a space
setopt HIST_FIND_NO_DUPS     # Don't find duplicates

# Sharing and Saving:
setopt SHARE_HISTORY          # Share history between sessions
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -laF'

eval "$(oh-my-posh init zsh --config ~/.mantastheme.omp.json)"

ZSH_HIGHLIGHT_STYLES[command]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=white,bold'

# Make hidden files count as "matches" so the list isn't empty
_comp_options+=(globdots)
