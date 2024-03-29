# zmodload zsh/zprof
source /etc/zsh/zprofile
autoload zkbd

#autoload zkbd
[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
[[ ! -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
source  ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
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

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/vendor/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dieter"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
zstyle :omz:plugins:ssh-agent agent-forwarding on
plugins=(git bundler pass git-prompt rake-fast zeus heroku docker docker-compose gradle ssh-agent)
export UNBUNDLED_COMMANDS=(spring)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

HISTSIZE=1000
# Число команд, сохраняемых в HISTFILE
SAVEHIST=1000

[[ -d ~/.zsh/functions ]] && source ~/.zsh/functions/*.zsh
[[ -e ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -e ~/.zsh/completions.zsh ]] && source ~/.zsh/completions.zsh

# исправляет баг с ruby
unset RUBYOPT

# Дистрибутиво-специфичные скрипты
for FILE in ~/.zsh/distros/*.sh; do
  source "${FILE}"
done

eval `dircolors -b ~/.dotfiles/vendor/dircolors-solarized/dircolors.ansi-dark`

# peжuм нaвuгaцuu в cтuлe emacs
bindkey -e

unsetopt correct_all

### Added by the Heroku Toolbelt
export PATH="$HOME/usr/bin:$PATH"

# Загружаем NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Загружаем RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use

unset RUBY_HEAP_INIT_SLOTS
unset RUBY_HEAP_FREE_MIN
unset RUBY_HEAP_SLOTS_INCREMENT
unset RUBY_HEAP_SLOTS_GROWTH_FACTOR
unset RUBY_GC_MALLOC_LIMIT
unset RUBY_GC_MALLOC_LIMIT_MAX

export RUBY_HEAP_INIT_SLOTS=2500000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_GC_MALLOC_LIMIT_MAX=1000000000

export GPGKEY=8C3A555D
export GPG_TTY=$(tty)

zstyle ':completion:*' matcher-list '' 'm:{-_}={_-}'

unsetopt listambiguous


export PROMPT_COMMAND='echo -ne "\033]0;$(basename ${PWD})\007"'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mainameiz/.sdkman"
[[ -s "/home/mainameiz/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mainameiz/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/mainameiz/yandex-cloud/path.bash.inc' ]; then source '/home/mainameiz/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/mainameiz/yandex-cloud/completion.zsh.inc' ]; then source '/home/mainameiz/yandex-cloud/completion.zsh.inc'; fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# zprof
