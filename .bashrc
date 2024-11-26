# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Prompt
set -o vi   # set vi mode prompt
export PS1=" \w \e[33m$\e[0m " 

# Ranger
export RANGER_LOAD_DEFAULT_RC=false

# Alias
alias ll="ls -l"
alias la="ls -la"

