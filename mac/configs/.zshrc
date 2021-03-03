# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Frank's Custom Aliases ##
############################
alias resetsound="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"

## Custom Functions
gitprunelocal() {
        # get all the local branches and edit out any ones you want to keep
        git branch -vv >/tmp/merged-branches && vim /tmp/merged-branches
        # sed: add an asterisk since git prepends current branch with asterisk
        # awk: and print pure branch name
        # grep: filter out branches that start with develop or master
        # xargs: execute delete branch for each new line
          # bonus tip: you can set xargs delimiter as space instead of the default new line via xargs -d' '
        sed 's/^/*/' < /tmp/merged-branches | awk '{print $2}' | grep -v "^develop\|master" | xargs git branch -D
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Boardwalk
##############
alias boardawscred="~/Projects/boardwalk/bwp-cds-common/aws-credentials-generator/generate-credentials.py"
alias boardawsdocker="docker logout; aws ecr get-login-password --region us-east-1 --profile sharedservices | docker login -u AWS --password-stdin 342068781230.dkr.ecr.us-east-1.amazonaws.com/golden-image-api"
alias dockernuke="docker system prune -a"
alias dockerlogin="aws ecr get-login-password --region us-east-1 --profile sharedservices | docker login -u AWS --password-stdin 342068781230.dkr.ecr.us-east-1.amazonaws.com/golden-image-api"
alias sshdev="ssh qif@3.93.126.176 -i ~/.ssh/board_rsa -L 3305:bwp-gms-dev-aurora-rdsproxy.cluster-cztswafip9oo.us-east-1.rds.amazonaws.com:3306 -fN"
alias sshstaging="ssh qif@54.158.76.39 -i ~/.ssh/board_rsa -L 3304:bwp-gms-staging-aurora-rdsproxy.cluster-cztswafip9oo.us-east-1.rds.amazonaws.com:3306 -fN"
alias sshpreprod="ssh qif@52.44.25.20 -i ~/.ssh/board_rsa -L 3303:bwp-gms-preprod-aurora-rdsproxy.cluster-chktulxvguy1.us-east-1.rds.amazonaws.com:3306 -fN"
alias sshdevmongo="ssh qif@3.93.126.176 -i ~/.ssh/board_rsa -L 3300:bwp-gms-dev-documentdb.cluster-cztswafip9oo.us-east-1.docdb.amazonaws.com:27017 -fN"
alias sshstagingmongo="ssh qifrank@54.158.76.39 -i ~/.ssh/board_rsa -L 3301:bwp-gms-staging-documentdb.cluster-cztswafip9oo.us-east-1.docdb.amazonaws.com:27017 -fN"
alias sshpreprodmongo="ssh qifrank@52.44.25.20 -i ~/.ssh/board_rsa -L 3302:preprod-documentdb-restore-100.cluster-chktulxvguy1.us-east-1.docdb.amazonaws.com:27017 -fN"
alias sshcache="ssh qif@3.93.126.176 -i ~/.ssh/board_rsa -L 6379:dev-redis-001.dev-redis.icjfqt.use1.cache.amazonaws.com:6379 -fN"
alias sshstagingread="ssh qifrank@54.158.76.39 -i ~/.ssh/board_rsa -L 3307:bwp-gms-staging.cluster-ro-cztswafip9oo.us-east-1.rds.amazonaws.com:3306 -fN"

export boardartuser=qif@boardwalk.corp
export boardartkey=AKCp5e3VF1BxupuJnYxY8nrmqvC2vVBuvmiLRS8PikHT74Vkd33gT2Ta4JMTGCyat9EsSCD1k

export SSH_KEY_NAME="board_rsa"
#export PATH="/usr/local/opt/qt/bin:$PATH"
###############################################

export PATH="/opt/homebrew/bin:$PATH"

### Dictionary of useful commands
###################################

# Tells whether you're currently executing as arm or x86
# uname -m

# Tunnel test
# nc -z localhost 3302 || echo 'no tunnel'
###################################

## Powerlevel10k
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## MUST BE THE LAST LINE OF ZSH ##
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh