# Created by newuser for 5.0.8
autoload -U colors && colors
#Включить автодополнение 
autoload -U compinit promptinit 
compinit
promptinit
# Для pacman
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman
# Корректировка ввода
setopt CORRECT_ALL
# Если в слове есть ошибка, предложить исправить её
SPROMPT="Ошибка! ввести %r вместо %R? (Yes/No/Edit/Abort) "
# Не нужно всегда вводить cd
# просто наберите нужный каталог и окажитесь в нём
setopt autocd
# При совпадении первых букв слова вывести меню выбора
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
setopt HIST_IGNORE_DUPS
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
autoload -Uz promptinit
  prompt adam2
#
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES=(
        'alias'           'fg=153,bold'
        'builtin'         'fg=166'
        'function'        'fg=166'
        'command'         'fg=25'
        'precommand'      'fg=100, underline'
        'hashed-commands' 'fg=166'
        'path'            'underline'
        'globbing'        'fg=166'
)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
###

#  History
# хранить историю в указанном файле
export HISTFILE=~/.zsh_history
# максимальное число команд, хранимых в сеансе
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
# включить историю команд
setopt APPEND_HISTORY
# убрать повторяющиеся команды, пустые строки и пр.
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS


eval $(thefuck --alias)

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh