PATH="/mingw64/bin:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -e
bindkey '^R' history-incremental-search-backward

bindkey "\eOd" backward-word
bindkey "\eOc" forward-word
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

zstyle :compinstall filename '/c/Users/Dennis/msys/.zshrc'
autoload -Uz compinit
compinit

#autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

[[ -d $HOME/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d $HOME/bin ]] && PATH="$HOME/bin:$PATH"

[[ -x ~/bin/shellcolors ]] && ~/bin/shellcolors

if [ -x /usr/bin/dircolors ]; then
    [[ -r ~/.dircolors.conf ]] && eval "$(dircolors -b ~/.dircolors.conf)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -x ~/bin/keychain ] && [ -e ~/.ssh/id_rsa ]; then
    eval $(keychain --eval --agents ssh id_rsa)
fi

if [ -x /usr/bin/powerline ]; then
    export POWERLINE_CONFIG_PATHS=/usr/share/powerline/config_files/:/usr/local/share/powerline/
    powerline-daemon -q
    . /usr/share/powerline/bindings/zsh/powerline.zsh
fi

