# zsh aliases
# - yuri - July 2014

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias df='df -hT -x tmpfs -x devtmpfs'
alias free='free -ht'
alias vi='vim'
alias packer='packer --noedit'
alias hackterm='nohup urxvt -fg "rgb:00/aa/00" -bg "rgba:0000/0000/0000/ee00" -e zsh -c "cmatrix -aBls && zsh" > /dev/null 2>&1 &'
alias cmatrix='cmatrix -aBls'
alias checklibs='lsof +c 0 | grep '\''DEL.*lib'\'' | awk '\''1 { print $1 ": " $NF }'\'' | sort -u'

# give common file types default behavior
alias -s com="$BROWSER"
alias -s net="$BROWSER"
alias -s org="$BROWSER"
alias -s pdf="$BROWSER" # requires browser pdf plugin

alias -s txt="$EDITOR"
alias -s md="$EDITOR"
alias -s markdown="$EDITOR"
alias -s htm="$EDITOR"
alias -s html="$EDITOR"
alias -s ino="$EDITOR"
alias -s c="$EDITOR"
alias -s cpp="$EDITOR"
alias -s h="$EDITOR"

alias -s jar="java -jar"

alias -s iso="vlc"
alias -s avi="vlc"
alias -s AVI="vlc"
alias -s mov="vlc"
alias -s mpg="vlc"
alias -s m4v="vlc"
alias -s mp4="vlc"
alias -s rmvb="vlc"
alias -s MP4="vlc"
alias -s ogg="vlc"
alias -s ogv="vlc"
alias -s flv="vlc"
alias -s mkv="vlc"
alias -s wav="vlc"
alias -s mp3="vlc"
alias -s webm="vlc"

alias -s tif="feh"
alias -s tiff="feh"
alias -s png="feh"
alias -s jpg="feh"
alias -s jpeg="feh"
alias -s JPG="feh"
alias -s gif="feh"
alias -s svg="feh"
alias -s psd="feh"
