#
# ~/.zshrc
#
# yuri - Jul 2014

BROWSER='/usr/bin/google-chrome-stable'
if [ -n "$WINDOWID" ]; then # this shell is running in X
  EDITOR='/usr/bin/gvim'
else
  EDITOR='/usr/bin/vim'
fi

ZSH="$HOME/.config/zsh"
PLUGINS="$ZSH/plugins"
CUSTOM="$ZSH/custom"

# add --user-install ruby gems to PATH
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# initialize colors and completion
autoload -U compinit promptinit colors
compinit
colors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

# this is the highlight color for tab completion menu selection
ZLS_COLORS="ma=47:$LS_COLORS"

# enable arrow key navigation of tab completion options
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)ZLS_COLORS}

# tab completion options
setopt completealiases
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

# in order try:
#   simple tab completion
#   case insensitive completion
#   simple substring completion
#   case insensitive substring completion
#   by defining multiple patterns, completion performance remains fast
#     while still affording tons of flexibility
zstyle ':completion:*' matcher-list '' 'm:{A-ZÄÖÜa-zäöü}={a-zäöüA-ZÄÖÜ}'                  \
                                       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'                   \
                                       'm:{A-ZÄÖÜa-zäöü}={a-zäöüA-ZÄÖÜ} r:|[._-]=* r:|=*' \
                                       'm:{A-ZÄÖÜa-zäöü}={a-zäöüA-ZÄÖÜ} l:|=* r:|=*'

# command history
HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=4096

# prevent duplicate history entries
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS

#share history between terminals
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# add search functionality to up and down arrow keys
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# a few more keybindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# vi mode settings
bindkey -v
KEYTIMEOUT=1 # reduce time to transition between INSERT and NORMAL

# right prompt indication of INSERT vs NORMAL vi modes
# perhaps a bit more complex with substitution than required
#   in order to prepend vi mode to righthand prompt
# function zle-line-init zle-keymap-select {
#     VI_MODE="${${KEYMAP/vicmd/[NORMAL]}/(main|viins)/[INSERT]}"
#     RPS1=${RPS1/\[*\] /}
#     RPS1="$VI_MODE $RPS1"
#     RPS2=$RPS1
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# cursor shape indication of INSERT vs NORMAL vi modes
# supported (at a minimum) by rxvt-unicode-256color and xterm
zle-keymap-select () {
  if [[ "$TERM" =~ "^rxvt|^xterm" ]]; then
if [ $KEYMAP = vicmd ]; then
echo -ne "\033[1 q"
    else
echo -ne "\033[3 q"
    fi
fi
}
zle -N zle-keymap-select

zle-line-init () {
  zle -K viins
  echo -ne "\033[3 q"
}
zle -N zle-line-init

# nicely formatted prompt
PROMPT="%m%{$fg[white]%} %n %{$fg_no_bold[blue]%}%~ %{$fg[white]%}%# %{$reset_color%}"

# yuri - set fixed window title for transparent desktop terminal
#   test for custom named terminal with same window id as the present one
#   if it matches, set the window title so that the compositor and
#   window manager can treat it appropriately

if [ -n "$WINDOWID" ]; then # this shell is running in X

  # use X forwarding with ssh
  alias ssh='ssh -Y'

  # this dynamically sets the window title of terminal windows
  # it's mostly just an openbox hack, hence the desktop session condition
  DESKTOPWINDOWID=0
  if [ -n $WINDOWID ]; then
    wmctrl -l > /dev/null 2>&1 && DESKTOPWINDOWID=$((`wmctrl -lpx | grep 'URxvtDesktop.URxvt' | awk '{ print $1 }'`))
  fi
  if [ $WINDOWID -eq $DESKTOPWINDOWID ]; then
    print -n "\e]0;URxvtDesktop\a"
    # display system info on the desktop terminal
    if [ $DESKTOP_SESSION = "openbox" ]; then
      archey
    fi
  else
    case $TERM in
      termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
        precmd () { print -Pn "\e]0;%n@%M:%~\a" } 
        preexec () { print -Pn "\e]0;%n@%M:%~ ($1)\a" }
        ;;
    esac

  fi
fi

# plugins / scripts
# source $CUSTOM/git-prompt.zsh # better/faster git prompt than the oh-my-zsh plugin
source $CUSTOM/aliases.zsh    # all aliases in one place
source $PLUGINS/history-substring-search/history-substring-search.zsh
