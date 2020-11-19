# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="disconnect"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
#HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
#HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration
#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
#export ARCHFLAGS="-arch x86_64"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES={{@@ _dotdrop_workdir @@}}
export GOPATH="$HOME/go"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract z ssh-agent)

zstyle :omz:plugins:ssh-agent identities id_rsa
source $ZSH/oh-my-zsh.sh

# Aliases
alias zshrc="vim $HOME/.zshrc"
alias reload="source $HOME/.zshrc"
alias dco="docker-compose"
alias pac="sudo pacman --noconfirm"
alias mci="sudo make clean install"

# Git
alias gcb='git branch | egrep -v "(master|\*)" | xargs git branch -D'

# Dotfiles
alias dotfiles="dotdrop --cfg=$DOTFILES/config.yaml.j2 -f --profile=disconnect"
alias sudotfiles="sudo dotdrop --cfg=$DOTFILES/root-config.yaml.j2 -f --profile=disconnect"
alias dot="dotfiles install"
alias sudot="sudotfiles install"

# Ambient
alias wallpaper="$HOME/.scripts/wallpaper.sh"
alias lockscreen="$HOME/.scripts/lockscreen.sh"
alias resetwallpapers="rm $HOME/.cache/.used_wallpapers"
alias resetlockscreens="rm $HOME/.cache/.used_lockscreens"

# Django
alias managepy='.venv/bin/python3 manage.py'
alias makemig='.venv/bin/python3 manage.py makemigrations'
alias mig='.venv/bin/python3 manage.py migrate'

# Greeter
echo Welcome, $(whoami)!
echo $(date +"%H:%M:%S - %d:%m:%Y")
echo ""
