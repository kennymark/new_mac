# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="theunraveler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

alias zshrc='code ~/.zshrc'
alias .rc='cursor ~/.zshrc'

## npm aliases
alias ni='npm install -S'
alias nu='npm uninstall'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nr='npm run'
alias npminit='npm init -y'
alias ns='npm start'
alias flush-npm="rm -rf node_modules && npm i"
alias start='npm run start'
alias dev='npm run dev'
alias build='npm run build'
alias deploy='npm run deploy'
alias test='npm run test'
alias nlist='npm list --depth=0'
alias nlistg='npm list -g --depth=0'

## git aliases
alias init='git init'
alias add='git add'
alias pull='git pull'
alias branch='git branch'
alias merge='git merge'
alias log='git log --oneline'
alias commit='git commit -m'
alias checkout='git checkout'
alias checkoutb='git checkout -b'
alias clone='git clone'
alias push='git push'
alias status='git status'
alias deleteb='git branch -d'
alias l='exa -a'
alias ls='exa'
alias lst='exa --tree --level=2'
alias clr='clear'
alias undo-last-commit="git reset HEAD~1"
alias speedtest='speed-test'
alias kp='killall -9 node'
alias docs='cd ~/Documents'
alias adonis='node ace'
alias bin='cd ~/.Trash'
alias next-lite="git clone git@gitlab.com:kennymark/next-starter-lite.git"
alias bs="brew services $@"
alias dc='docker-compose'
alias cat="bat"
alias bat='cat'
alias logssh="cat ~/.ssh/id_rsa.pub"
alias '??'="ai you an shell assistant, only return shell commands in one line $@"
alias find-electron-apps=" find /Applications -name '*.asar' -print"
alias pg-start='brew services start postgresql@16'
alias pg-stop='brew services stop postgresql@16'
alias create-db='createdb -h 127.0.0.1 -p 5432 -U "$(whoami)" $1'
alias list-db='psql -h 127.0.0.1 -p 5432 -U $(whoami) -d postgres -c "\l"'
alias rename='mv'
alias tunnel='outray 3333 --subdomain togetha'
alias seed='node ace db:seed'
alias freshseed='node ace migration:fresh && node ace db:seed'
alias ai='ollama run qwen2.5-coder:latest'
alias cosmos='npm run cosmos'
alias publish='npm publish'
alias c='clear'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias weather='curl wttr.in'
alias cd='z'





export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Fig post block. Keep at the bottom of this file.
# # eval "$(starship init zsh)"

# bun completions
[ -s "/Users/kennycoffie/.bun/_bun" ] && source "/Users/kennycoffie/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kennycoffie/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kennycoffie/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kennycoffie/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kennycoffie/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# pnpm
export PNPM_HOME="/Users/kennycoffie/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opencode
export PATH=/Users/kennycoffie/.opencode/bin:$PATH

eval "$(zoxide init zsh)"
