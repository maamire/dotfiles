# ~/.bashrc

# Exports
export EDITOR='/usr/bin/vim'
export BROWSER='firefox'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# History
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Options
shopt -s checkwinsize
shopt -s globstar 2>/dev/null

# Plugins
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

# Colours
export TERM='xterm-256color'
alias ls='ls --color=auto'
[[ -f ~/.dircolors ]] && eval $(dircolors ~/.dircolors)
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Prompt
PS1='\[\033[1;32m\]\u@\h\[\033[0m\] \[\033[1;34m\]\W\[\033[0m\] \[\033[1;33m\]$\[\033[0m\] '

# dotfiles
alias bashrc='$EDITOR ~/.bashrc'
alias vimrc='$EDITOR ~/.vimrc'
alias dotfiles='/usr/bin/git --git-dir="/$HOME/.dotfiles" --work-tree="$HOME"'

#Set bat
alias cat='bat --paging=never'
alias bathelp='bat --plain --language=help'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


# FuzzyFind
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden \
  --exclude .git \
  --exclude node_modules \
  --exclude ".local/share/Steam" \
  --exclude "steamapps" \
  --exclude ".steam" \
  --exclude ".wine" \
  --exclude "dosdevices" \
  --exclude "drive_c" \
  --exclude "pfx" \
  --exclude "wineprefix" \
  --exclude "PlayOnLinux" \
  --exclude "lutris" \
  --exclude ".local/share/bottles" \
  --exclude ".local/share/lutris" \
  --max-depth 20'
export FZF_ALT_C_COMMAND='fd --type d --hidden \
  --exclude .git \
  --exclude node_modules \
  --exclude target \
  --exclude ".local/share/Steam" \
  --exclude ".steam" \
  --exclude "steamapps" \
  --exclude ".wine" \
  --exclude "dosdevices" \
  --exclude "drive_c" \
  --exclude "pfx" \
  --exclude "wineprefix" \
  --exclude "PlayOnLinux" \
  --exclude "lutris" \
  --exclude ".local/share/lutris" \
  --exclude ".local/share/bottles" \
  --max-depth 10 . 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
_fzf_compgen_path(){
    fd --type f --hidden --max-depth 6 . \
        ~/        \
        ~/Projects \
        ~/Documents \
        ~/.config \
        2>/dev/null
}

_fzf_compgen_dir(){
    fd --type d --hidden --max-depth 4 . \
        ~/        \
        ~/Projects \
        ~/Documents \
        ~/.config \
        2>/dev/null
}
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border --inline-info"

# Python & pyenv
alias venv='source venv/bin/activate'
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
