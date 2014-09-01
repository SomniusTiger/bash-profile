## GIT & DEVELOPMENT HAPPINESS ##

# --------------------
# Colors for the prompt
# --------------------
# Set the TERM var to xterm-256color
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi
if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    # this is for xterm-256color
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 226)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)
    ORANGE=$(tput setaf 172)
    # GREEN=$(tput setaf 190)
    PURPLE=$(tput setaf 141)
    BG_BLACK=$(tput setab 0)
    BG_RED=$(tput setab 1)
    BG_GREEN=$(tput setab 2)
    BG_BLUE=$(tput setab 4)
    BG_MAGENTA=$(tput setab 5)
    BG_CYAN=$(tput setab 6)
    BG_YELLOW=$(tput setab 226)
    BG_ORANGE=$(tput setab 172)
    BG_WHITE=$(tput setab 7)
  else
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
  UNDERLINE=$(tput sgr 0 1)
else
  BLACK="\[\e[0;30m\]"
  RED="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  YELLOW="\[\e[0;33m\]"
  CYAN="\[\e[0;36m\]"
  BLUE="\[\e[0;34m\]"
  BOLD=""
  RESET="\033[m"
fi

# Styles for cmd prompt

style_user="${RESET}${WHITE}"
style_path="${RESET}${CYAN}"
style_chars="${RESET}${WHITE}"
style_branch="${RED}"

source ~/.profile

# Auto-complete git commands and branch names
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# Define how the prompt is styled. Colorizes the directory path & git branch, puts your commands on a new line
export PS1='${style_user}\u${style_chars}@\h:${style_path}\w${style_branch}$(__git_ps1)${style_chars}\n∞${RESET} '

# Auto-delete merged git branches
alias git_delete_merged="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

# Auto-archive merged git branches
alias git_archive_merged=""

# Say "activated," then start a rails server. Say "goodbye" on server stop.
alias s="afplay ~/Documents/sounds/turret_activated.wav && rails s && afplay ~/Documents/sounds/turret_goodbye.wav"

# Say "deploying," then deploy using Capistrano to production, then say "well done"
alias cpd="afplay ~/Documents/sounds/turret_deploy.wav && cap production deploy && afplay ~/Documents/sounds/turret_welldone.wav"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## NIFTY OSX SHORTCUTS ##

# Open files from terminal with sublime
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR='subl'

# Hilarious SUDO alias
alias fucking='sudo'

# Proper link to path
export PATH=/usr/local/bin:$PATH

# Quickly go to src folder
alias www="cd /Users/Somnius/src"

#Restart Finder
alias killfinder="killall Finder"

# Show/hide hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# Disable/enable the background shadow in screenshots
alias screenshadowoff="defaults write com.apple.screencapture disable-shadow -bool true && killall SystemUIServer"
alias screenshadowon="defaults write com.apple.screencapture disable-shadow -bool false && killall SystemUIServer"

# Disable/reenable Spotlight for Mac
alias spotlightoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spotlighton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
