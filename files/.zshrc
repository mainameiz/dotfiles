source /etc/zsh/zprofile

autoload zkbd
[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
[[ ! -f ~/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source  ~/.zkbd/$TERM-$VENDOR-$OSTYPE
#setup key accordingly
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# файл истории команд 
HISTFILE=~/.histfile

HISTSIZE=1000

# Число команд, сохраняемых в HISTFILE 
SAVEHIST=1000

setopt appendhistory no_beep extendedglob nomatch
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt histexpiredupsfirst histfindnodups
unsetopt notify
setopt IGNORE_EOF

# peжuм нaвuгaцuu в cтuлe emacs 
bindkey -e

fpath=(~/.zsh/Completion $fpath)
zstyle :compinstall filename '~/.zshrc'
# менюшку нам для астокомплита 
zstyle ':completion:*' menu yes select
# разукрашенное автодополнение PID'ов для kill 
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"

# Hosts completion from .ssh/known_hosts
#local _myhosts
#_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
#zstyle ':completion:*' hosts $_myhosts

# Позволяем разворачивать сокращенный ввод, к примеру cd /u/sh в /usr/share 
autoload -Uz compinit && compinit

alias grep='grep --colour=auto'
# показ классификации файлов в цвете
alias ls='ls --color=auto'
# вывog в gлuннoм фopмaтe
alias ll='ls -lh'
# вывog всех файлов, включая dot-фaйлы, kpoмe . u ..
alias la='ls -lAh'
# вывog вcex фaйлoв в gлuннoм фopмaтe, вkлючaя inodes
alias li='ls -ial'
# вывод только каталогов
alias lsd='ls -ld *(-/DN)'
# вывog тoльko dot-фaйлoв
alias lsa='ls -ld .*'
# сокращения для cd
alias cd..='cd ..'
alias ..='cd ..'
alias ....='cd ../..'
# человекочитаемые df и du
alias df='df -h'
alias du='du -sh'
# переименование-перемещение c пogтвepжgeнueм без коррекции
alias mv='nocorrect mv -i'
# рекурсивное копирование с подтверждением без коррекции
alias cp='nocorrect cp -iR'
# удаление с подтверждением без коррекции
alias rm='nocorrect rm'
# принудимтельное удаление без коррекции
alias rmf='nocorrect rm -f'
# принудительное рекурсивное удаление без коррекции
alias rmrf='nocorrect rm -fR'
# создание каталогов без коррекции
alias mkdir='nocorrect mkdir'
# readable free
alias free='free -m'
# ssh
alias s='ssh'

# разукрашиваем некоторые команды с помощью grc
[[ -f /usr/bin/grc ]] && {
  alias ping="grc --colour=auto ping"
  alias traceroute="grc --colour=auto traceroute"
  alias make="grc --colour=auto make"
  alias diff="grc --colour=auto diff"
  alias cvs="grc --colour=auto cvs"
  alias netstat="grc --colour=auto netstat"
}

# алиасы по расширениям файлов
alias -s ini=vim
alias -s rb=vim
alias -s conf=vim
alias -s cfg=vim
alias -s txt=vim

# Загружаем RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Легкая распаковка архивов
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

 
# See if we can use colors.
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
   for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done
   PR_NO_COLOUR="%{$terminfo[sgr0]%}"
 
if [[ ${EUID} == 0 ]]; then
  PROMPT="%B$PR_RED%M $PR_BLUE%/ # $PR_NO_COLOUR%b"
else
  local path_p="$PR_MAGENTA%/$PR_NO_COLOUR%b"
  local user_host="%B$PR_GREEN%n@%M$PR_NO_COLOUR"
  PROMPT="${user_host}${path_p}
$PR_BLUE%# > $PR_NO_COLOUR"
fi

# часы справа
#RPROMPT="%B%*%b"

# баг с ruby
unset RUBYOPT

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# включает возможность редактировать команды в редакторе
# Ctrl+x; Ctrl+e 
autoload edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Дистрибутиво-специфичные скрипты
for FILE in `ls ~/.zsh/distros/*.sh`; do
  source "${FILE}"
done
