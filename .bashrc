if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL='ignoreboth'

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp='cp -iuv'    # confirm before overwriting something
alias mv='mv -iuv'    # confirm before overwriting something
alias rm='rm -iv'    # confirm before removing something
alias df='df -h'     # human-readable sizes
alias free='free -m'    # show sizes in MB
alias vp='vim PKGBUILD'
alias vs='vim SPLITBUILD'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# vim stuff
export EDITOR='vim'  # EDITOR='emacs -nw'
export VISUAL='vim'  # VISUAL='emacs -nw'
alias vi='vim'
set -o 'vi'

# prompt
PS1='[\u@\h \W]\$ '

# readline-wrapped repls
alias csi='rlwrap csi'
alias guile='rlwrap guile'
alias racket='rlwrap racket'
alias mosml='rlwrap mosml'
alias poly='rlwrap poly'
alias sml='rlwrap sml'
alias ocaml='rlwrap ocaml'
alias coqtop='rlwrap coqtop'
alias irb='rlwrap irb'
alias Self='rlwrap Self'
alias twelf='rlwrap twelf-server'
alias bp='rlwrap bp -l'
alias xsb='rlwrap xsb'
alias yap='rlwrap yap'
alias chibi='rlwrap chibi-scheme'

alias dmenu_run="dmenu_run -p 'run:' -fn 'Akashi-11:Normal' -nb '#b1c75c' -nf '#ffffff' -sb '#ffd300' -sf '#000000'"

alias ichrome='google-chrome --incognito'
alias ichromium='chromium --incognito'

export TERM='rxvt-256color'

export LOGTALKHOME="${HOME}"/apps/logtalk/share/logtalk
export LOGTALKUSER="${HOME}"/.logtalk

export PATH=~/.scripts:~/.cabal/bin:~/apps/twelf/bin:~/apps/XSB/bin:~/apps/yap/bin:~/apps/logtalk/bin:"${LOGTALKHOME}"/tools/lgtdoc/xml:"${LOGTALKHOME}"/scripts:"${LOGTALKHOME}"/integration:"${PATH}"
export MANPATH="${LOGTALKHOME}"/man

# save path on cd
function cd {
  builtin cd "$@"
  pwd > ~/.pwd
}

# restore last saved path
if [ -f ~/.pwd ]
  then cd "$(cat ~/.pwd)"
fi

