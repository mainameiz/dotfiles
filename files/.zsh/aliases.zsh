alias grep='grep --colour=auto'
# показ классификации файлов в цвете
alias ls='ls --color=auto'
# вывog в gлuннoм фopмaтe
alias ll='ls -lh'
# вывog всех файлов, включая dot-фaйлы, kpoмe . u ..
alias la='ls -lah'
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
alias g='grep'
alias psa='ps aux'
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

alias devlog='tail -f log/development.log'
alias testlog='tail -f log/test.log'

alias tmux="TERM=xterm-256color tmux attach || tmux new"

#alias vim="gvim --remote"
alias flushdb="redis-cli flushdb"

alias greplace="git add --all; git ciam; git put -f"
alias gd="git diff --ignore-all-space"
alias gdca="git diff --cached --ignore-all-space"

alias bm="~/projects/bookmate"
alias pub="~/projects/publisher"
alias rol="~/projects/roleus"
alias open="xdg-open"


alias git_clear_local_branches="git fetch --prune; git branch -vv | grep ': gone]' | cut -d' ' -f3 | xargs -I{} git branch -D {}"
