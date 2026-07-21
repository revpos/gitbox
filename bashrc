# ~/.bashrc - Git Sandbox Environment

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# Enable bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# --- Aliases ---
alias ..="cd .."
alias ...="cd ../../"
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'

# Helper Functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

cl() {
    cd "$1" && ls -F --color=auto
}

# --- Git Prompt Configuration ---
export GIT_PS1_SHOWDIRTYSTATE=1      # '*' for unstaged, '+' for staged
export GIT_PS1_SHOWUNTRACKEDFILES=1  # '%' for untracked files
export GIT_PS1_SHOWUPSTREAM="auto"   # '<', '>', '=', or '<>' relative to upstream
export GIT_PS1_SHOWSTASHSTATE=1      # '$' for stashes
export GIT_PS1_SHOWSEPARATOR=1       # Enable separator
export GIT_PS1_STATESEPARATOR="|"    # Separator between branch and status
export GIT_PS1_HIDE_IF_PWD_IGNORED=1 # Hide inside .gitignore'd paths
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWCONFLICTSTATE="yes" # Conflict state indicator

# Load Git prompt script
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
elif [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# Set Bash Prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)"); PS1="\[\e[32;1m\]\u@gitbox\[\e[0m\]:\[\e[34;1m\]\w\[\e[1;33m\]${PS1_CMD1}\[\e[0m\]\$ "'