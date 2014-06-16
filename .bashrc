#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# include common options for commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias df='df -hT -x tmpfs -x devtmpfs'
alias free='free -ht'

# PS1='\u@\h: \w\$ '
# yuri - nicer looking command prompt in solarized scheme
PS1='\[\e[0;37m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;37m\]\$\[\e[m\] '

# yuri - set fixed window title for transparent desktop terminal
#   test for custom named terminal with same window id as the present one
#   if it matches, set the window title so that the compositor and
#   window manager can treat it appropriately

if [ -n "$WINDOWID" ]; then # this shell is running in X

  # use X forwarding with ssh
  alias ssh='ssh -Y'

  DESKTOPWINDOWID=$((`wmctrl -lpx | grep URxvtDesktop | awk '{ print $1 }'`))
  if [ $WINDOWID -eq $DESKTOPWINDOWID ]; then
    PROMPT_COMMAND='echo -ne "\033]0;URxvtDesktop\007"'
    # display system info on the desktop terminal
    archey
  fi
fi

# add --user-install ruby gems to PATH
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
