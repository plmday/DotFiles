#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export HISTTIMEFORMAT="%Y-%m-%d %T "

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

