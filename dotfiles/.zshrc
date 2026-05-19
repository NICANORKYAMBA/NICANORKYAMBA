#####################################################################
###                                                               ###
### Ultra-Modern Professional ZSH Theme by Nicanor                ###
### Requires: NerdFonts, zsh-syntax-highlighting, autosuggestions ###
###                                                               ###
#####################################################################

# ═══════════════════════════════════════════════════════════════════
# ⚡ CORE ZSH CONFIGURATION
# ═══════════════════════════════════════════════════════════════════
setopt autocd autopushd pushdignoredups
setopt correct interactivecomments magicequalsubst

# Custom spelling correction prompt
SPROMPT="%F{196}🤔 Did you mean %F{046}%B%r%b%f instead of %F{196}%B%R%b%f? [%F{046}y%f/%F{196}n%f/%F{226}a%f/%F{081}e%f] "
setopt nonomatch notify numericglobsort promptsubst
setopt hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify
setopt extended_glob glob_dots

WORDCHARS=${WORDCHARS//\/}
PROMPT_EOL_MARK=""

# ═══════════════════════════════════════════════════════════════════
# 🎯 ADVANCED KEYBINDINGS
# ═══════════════════════════════════════════════════════════════════
bindkey -e
bindkey ' ' magic-space
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[Z' undo
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# ═══════════════════════════════════════════════════════════════════
# 🚀 ENHANCED COMPLETION SYSTEM
# ═══════════════════════════════════════════════════════════════════
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# ═══════════════════════════════════════════════════════════════════
# 📚 HISTORY CONFIGURATION
# ═══════════════════════════════════════════════════════════════════
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
alias history="history 0"

# ═══════════════════════════════════════════════════════════════════
# 🎨 ADVANCED COLOR SYSTEM
# ═══════════════════════════════════════════════════════════════════
autoload -U colors && colors
case "$TERM" in
    xterm-color|*-256color|screen-256color|tmux-256color) color_prompt=yes;;
esac
force_color_prompt=yes

# ═══════════════════════════════════════════════════════════════════
# 🌟 ULTRA-ADVANCED GIT INTEGRATION
# ═══════════════════════════════════════════════════════════════════
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:git:*' formats ' %F{081}%f %F{213}%B%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{081}%f %F{213}%B%b%f %F{196}(%a)%f'
zstyle ':vcs_info:*' enable git

# Advanced Git Status with Performance Optimization
git_status_detailed() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return
    fi

    local git_status_output=$(git status --porcelain 2>/dev/null)
    local git_status_icons=""
    local ahead_behind=$(git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null)

    # File status indicators
    if [[ -n $git_status_output ]]; then
        local modified=$(echo "$git_status_output" | grep -c "^M ")
        local added=$(echo "$git_status_output" | grep -c "^A ")
        local deleted=$(echo "$git_status_output" | grep -c "^D ")
        local untracked=$(echo "$git_status_output" | grep -c "^??")
        local unstaged=$(echo "$git_status_output" | grep -c "^ M")

        [[ $modified -gt 0 ]] && git_status_icons+=" %F{046}●$modified%f"
        [[ $added -gt 0 ]] && git_status_icons+=" %F{051}+$added%f"
        [[ $deleted -gt 0 ]] && git_status_icons+=" %F{196}-$deleted%f"
        [[ $untracked -gt 0 ]] && git_status_icons+=" %F{226}?$untracked%f"
        [[ $unstaged -gt 0 ]] && git_status_icons+=" %F{201}~$unstaged%f"
    else
        git_status_icons=" %F{046}✓%f"
    fi

    # Ahead/Behind indicators
    if [[ -n $ahead_behind ]]; then
        local behind=$(echo $ahead_behind | cut -f1)
        local ahead=$(echo $ahead_behind | cut -f2)
        [[ $ahead -gt 0 ]] && git_status_icons+=" %F{081}↑$ahead%f"
        [[ $behind -gt 0 ]] && git_status_icons+=" %F{214}↓$behind%f"
    fi

    echo "$git_status_icons"
}

# ═══════════════════════════════════════════════════════════════════
# 🌐 NETWORK & SYSTEM INFO
# ═══════════════════════════════════════════════════════════════════
get_network_info() {
    local eth_ip=$(ip -4 addr show eth0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
    local wifi_ip=$(ip -4 addr show wlan0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
    local vpn_ip=$(ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)

    local network_info=""
    [[ -n $eth_ip ]] && network_info+="%F{046}───%F{051}⟪%F{051}🌐$eth_ip%f%F{208}⟫"
    [[ -n $vpn_ip ]] && network_info+="%F{046}───%F{051}⟪%F{226}🔒$vpn_ip%f%F{208}⟫"
    [[ -n $wifi_ip ]] && network_info+="%F{046}───%F{051}⟪%F{201}📡$wifi_ip%f%F{208}⟫"

    echo "$network_info"
}

# ═══════════════════════════════════════════════════════════════════
# ☁️ CLOUD & DEVOPS CONTEXT
# ═══════════════════════════════════════════════════════════════════

# AWS Profile & Region
get_aws_context() {
    local aws_info=""
    if [[ -n $AWS_PROFILE ]]; then
        aws_info+="%F{214}☁️ %B$AWS_PROFILE%b%f"
        [[ -n $AWS_REGION ]] && aws_info+="%F{208}@$AWS_REGION%f"
    fi
    echo "$aws_info"
}

# Kubernetes Context & Namespace
get_k8s_context() {
    if command -v kubectl &>/dev/null; then
        local ctx=$(kubectl config current-context 2>/dev/null)
        local ns=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
        [[ -z $ns ]] && ns="default"
        if [[ -n $ctx ]]; then
            echo "%F{039}☸ %B${ctx:0:15}%b%f%F{081}:$ns%f"
        fi
    fi
}

# Docker Status
get_docker_status() {
    if command -v docker &>/dev/null && docker info &>/dev/null 2>&1; then
        local containers=$(docker ps -q 2>/dev/null | wc -l)
        local images=$(docker images -q 2>/dev/null | wc -l)
        [[ $containers -gt 0 || $images -gt 0 ]] && echo "%F{045}🐳%B$containers%b%f%F{240}/%f%F{045}$images%f"
    fi
}

# Terraform Workspace
get_terraform_workspace() {
    if [[ -d .terraform ]]; then
        local workspace=$(terraform workspace show 2>/dev/null)
        [[ -n $workspace ]] && echo "%F{135}🏗️ %B$workspace%b%f"
    fi
}

# Combined Cloud Context with separators
get_cloud_context() {
    local cloud_parts=()
    local aws=$(get_aws_context)
    local k8s=$(get_k8s_context)
    local docker=$(get_docker_status)
    local tf=$(get_terraform_workspace)

    [[ -n $aws ]] && cloud_parts+=("$aws")
    [[ -n $k8s ]] && cloud_parts+=("$k8s")
    [[ -n $docker ]] && cloud_parts+=("$docker")
    [[ -n $tf ]] && cloud_parts+=("$tf")

    if [[ ${#cloud_parts[@]} -gt 0 ]]; then
        local result=""
        for part in "${cloud_parts[@]}"; do
            if [[ -n $result ]]; then
                result+="%F{208}⟫%F{046}───%F{051}⟪"
            fi
            result+="$part"
        done
        echo "$result"
    fi
}

# ═══════════════════════════════════════════════════════════════════
# ⏱️ COMMAND EXECUTION TIME TRACKING
# ═══════════════════════════════════════════════════════════════════
function preexec() {
    cmd_start_time=$SECONDS
}

function precmd() {
    if [[ -n $cmd_start_time ]]; then
        local elapsed=$((SECONDS - cmd_start_time))
        if [[ $elapsed -gt 3 ]]; then
            cmd_exec_time=" %F{226}⏱ ${elapsed}s%f"
        else
            cmd_exec_time=""
        fi
        unset cmd_start_time
    fi
}

# ═══════════════════════════════════════════════════════════════════
# 🎭 ULTRA-MODERN PROMPT DESIGN
# ═══════════════════════════════════════════════════════════════════
if [ "$color_prompt" = yes ]; then
    # Ultra-modern prompt with vibrant colors and clean lines
    PROMPT='%F{046}╭───%F{051}⟪%F{033}󰀄 %F{201}%B%n%b%f%F{208}⟫$(get_network_info)
%F{046}├───%F{051}⟪ %F{226}%B%(6~.%-1~/…/%4~.%5~)%b%f%F{208}⟫${vcs_info_msg_0_}$(git_status_detailed)
%F{046}├───%F{051}⟪$(get_cloud_context)%F{208}⟫
%F{046}╰──%F{196}⚡%F{208}❯%F{226}❯%F{046}❯%f '

    # Sleek right prompt with gradient
    RPROMPT='%F{240}⟨%F{081}%D{%H:%M:%S}%f%F{240}⟩%f${cmd_exec_time}%(?.%F{046} ✨%f.%F{196} 💀 %?%f)%(1j. %F{220}⚙%j%f.)%(!.%F{196} 👑%f.)'

    # Secondary prompts with vibrant colors
    PS2="%F{046}├───%F{051}⟪ %F{226}%_%f %F{208}⟫ "
    PS3="%F{046}├───%F{051}⟪ %F{081}Select:%f %F{208}⟫ "
    PS4="%F{046}├───%F{051}⟪ %F{196}Debug:%f %F{208}⟫ "
fi

# ═══════════════════════════════════════════════════════════════════
# 🎨 ULTRA-ENHANCED SYNTAX HIGHLIGHTING
# ═══════════════════════════════════════════════════════════════════
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

    # Main highlighting styles with vibrant 256-colors
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196,bold
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=081,bold
    ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=046,underline
    ZSH_HIGHLIGHT_STYLES[global-alias]=fg=201,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=135,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=039,bold
    ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=046,underline
    ZSH_HIGHLIGHT_STYLES[path]=fg=226,underline
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=220
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=051,bold
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=081,bold
    ZSH_HIGHLIGHT_STYLES[command-substitution]=fg=213
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=201,bold
    ZSH_HIGHLIGHT_STYLES[process-substitution]=fg=135
    ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=135,bold
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=081
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=039,bold
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=226
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=220,bold
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=046
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=051,bold
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=046
    ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=201
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=213
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=201
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=135
    ZSH_HIGHLIGHT_STYLES[assign]=fg=081
    ZSH_HIGHLIGHT_STYLES[redirection]=fg=039,bold
    ZSH_HIGHLIGHT_STYLES[comment]=fg=240,italic
    ZSH_HIGHLIGHT_STYLES[named-fd]=fg=081
    ZSH_HIGHLIGHT_STYLES[numeric-fd]=fg=039,bold
    ZSH_HIGHLIGHT_STYLES[arg0]=fg=046,bold

    # Bracket highlighting with rainbow colors
    ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=196,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=081,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=046,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=201,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=226,bold
    ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=051,bold
    ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

    # Pattern highlighting with danger colors
    ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=196')
    ZSH_HIGHLIGHT_PATTERNS+=('sudo *' 'fg=black,bold,bg=214')
fi

# ═══════════════════════════════════════════════════════════════════
# 🤖 INTELLIGENT AUTOSUGGESTIONS
# ═══════════════════════════════════════════════════════════════════
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#666666,italic'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# ═══════════════════════════════════════════════════════════════════
# 🎯 PROFESSIONAL ALIASES & FUNCTIONS
# ═══════════════════════════════════════════════════════════════════

# Enhanced ls aliases with icons
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lahF --time-style=long-iso'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lahtr'
alias lsize='ls -lahS'

# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# System aliases
alias c='clear'
alias h='history'
alias j='jobs -l'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ps='ps auxf'
alias psg='ps aux | grep -v grep | grep -i -E --color=auto'
alias top='htop'

# Git aliases (Professional workflow)
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gc='git commit --verbose'
alias gcm='git commit --message'
alias gca='git commit --all --verbose'
alias gcam='git commit --all --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout main || git checkout master'
alias gcod='git checkout develop'
alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gm='git merge'
alias gp='git push'
alias gpo='git push origin'
alias gpu='git push --set-upstream origin'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grbi='git rebase --interactive'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gs='git status --short --branch'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# AWS CLI aliases
alias aws='aws'
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
alias awsr='export AWS_REGION=$(echo -e "us-east-1\nus-west-2\neu-west-1\neu-central-1\nap-southeast-1\nap-northeast-1" | fzf)'
alias awswho='aws sts get-caller-identity'
alias awsls='aws s3 ls'
alias ec2ls='aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,Tags[?Key==\`Name\`].Value|[0]]" --output table'
alias lambdals='aws lambda list-functions --query "Functions[*].[FunctionName,Runtime,LastModified]" --output table'
alias eksls='aws eks list-clusters --output table'
alias rdsls='aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus,Engine]" --output table'

# Kubernetes aliases (Enhanced)
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kga='kubectl get all'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kex='kubectl exec -it'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
alias kgc='kubectl config get-contexts'
alias kpf='kubectl port-forward'
alias kdel='kubectl delete'
alias kapp='kubectl apply -f'
alias ktop='kubectl top'
alias ktopp='kubectl top pods'
alias ktopn='kubectl top nodes'

# Docker aliases (Enhanced)
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dl='docker logs'
alias dlf='docker logs -f'
alias dstop='docker stop'
alias dstart='docker start'
alias drestart='docker restart'
alias dprune='docker system prune -af'
alias dc='docker-compose'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dclogs='docker-compose logs -f'
alias dcps='docker-compose ps'
alias dcrestart='docker-compose restart'

# Terraform aliases
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfv='terraform validate'
alias tff='terraform fmt'
alias tfw='terraform workspace'
alias tfws='terraform workspace select'
alias tfwl='terraform workspace list'
alias tfo='terraform output'
alias tfs='terraform state'
alias tfsl='terraform state list'
alias tfshow='terraform show'

# Development aliases
alias py='python3'
alias pip='pip3'
alias node='node'
alias npm='npm'
alias yarn='yarn'
alias code='code'
alias vim='nvim'
alias vi='nvim'

# Network aliases
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias wget='wget -c'
alias curl='curl -L'

# ═══════════════════════════════════════════════════════════════════
# 🚀 ADVANCED UTILITY FUNCTIONS
# ═══════════════════════════════════════════════════════════════════

# Smart extract function
extract() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *.xz)        unxz $1        ;;
            *.lzma)      unlzma $1      ;;
            *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "extract: '$1' - file does not exist"
    fi
}

# Make directory and navigate
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find and kill process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [[ -n $pid ]]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Weather function with location
weather() {
    local location=${1:-""}
    curl -s "wttr.in/$location?format=3"
}

# System information
sysinfo() {
    echo "╭─────────────────────────────────────────────────────────────╮"
    echo "│                    🖥️  SYSTEM INFORMATION                   │"
    echo "├─────────────────────────────────────────────────────────────┤"
    echo "│ 🏷️  Hostname: $(hostname)"
    echo "│ 👤 User: $(whoami)"
    echo "│ 🐧 OS: $(lsb_release -d | cut -f2)"
    echo "│ 🏗️  Kernel: $(uname -r)"
    echo "│ ⏰ Uptime: $(uptime -p)"
    echo "│ 🧠 Memory: $(free -h | awk 'NR==2{printf "%s/%s (%.2f%%)", $3,$2,$3*100/$2}')"
    echo "│ 💾 Disk: $(df -h / | awk 'NR==2{printf "%s/%s (%s)", $3,$2,$5}')"
    echo "│ 🌡️  Load: $(uptime | grep -oP '(?<=load average: ).*')"
    echo "╰─────────────────────────────────────────────────────────────╯"
}

# Git repository summary
gitsum() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "╭─────────────────────────────────────────────────────────────╮"
        echo "│                     🔧 GIT REPOSITORY                       │"
        echo "├─────────────────────────────────────────────────────────────┤"
        echo "│ 📁 Repository: $(basename $(git rev-parse --show-toplevel))"
        echo "│ 🌿 Branch: $(git branch --show-current)"
        echo "│ 📝 Commits: $(git rev-list --count HEAD)"
        echo "│ 👥 Contributors: $(git shortlog -sn | wc -l)"
        echo "│ 📊 Status: $(git status --porcelain | wc -l) changes"
        echo "│ 🏷️  Tags: $(git tag | wc -l)"
        echo "╰─────────────────────────────────────────────────────────────╯"
    else
        echo "❌ Not a git repository"
    fi
}

# ═══════════════════════════════════════════════════════════════════
# ☁️ CLOUD & DEVOPS UTILITY FUNCTIONS
# ═══════════════════════════════════════════════════════════════════

# AWS Profile Switcher
awsswitch() {
    if command -v fzf &>/dev/null; then
        local profile=$(aws configure list-profiles | fzf --height 40% --reverse --prompt="AWS Profile: ")
        if [[ -n $profile ]]; then
            export AWS_PROFILE=$profile
            echo "✅ Switched to AWS profile: $profile"
            aws sts get-caller-identity 2>/dev/null || echo "⚠️  Profile set but credentials may be invalid"
        fi
    else
        echo "📦 Install fzf for interactive selection"
    fi
}

# Kubernetes Context Switcher
kswitch() {
    if command -v kubectl &>/dev/null && command -v fzf &>/dev/null; then
        local context=$(kubectl config get-contexts -o name | fzf --height 40% --reverse --prompt="K8s Context: ")
        if [[ -n $context ]]; then
            kubectl config use-context $context
            echo "✅ Switched to context: $context"
        fi
    else
        echo "📦 Install kubectl and fzf"
    fi
}

# Kubernetes Namespace Switcher
knsswitch() {
    if command -v kubectl &>/dev/null && command -v fzf &>/dev/null; then
        local namespace=$(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' | fzf --height 40% --reverse --prompt="Namespace: ")
        if [[ -n $namespace ]]; then
            kubectl config set-context --current --namespace=$namespace
            echo "✅ Switched to namespace: $namespace"
        fi
    else
        echo "📦 Install kubectl and fzf"
    fi
}

# Docker cleanup
dclean() {
    echo "🧹 Cleaning Docker resources..."
    docker container prune -f
    docker image prune -f
    docker volume prune -f
    docker network prune -f
    echo "✅ Docker cleanup complete!"
}

# Get pod logs with selection
klogs() {
    if command -v kubectl &>/dev/null && command -v fzf &>/dev/null; then
        local pod=$(kubectl get pods --all-namespaces -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name --no-headers | fzf --height 40% --reverse --prompt="Select Pod: ")
        if [[ -n $pod ]]; then
            local namespace=$(echo $pod | awk '{print $1}')
            local podname=$(echo $pod | awk '{print $2}')
            kubectl logs -f -n $namespace $podname
        fi
    else
        echo "📦 Install kubectl and fzf"
    fi
}

# Execute into pod
kshell() {
    if command -v kubectl &>/dev/null && command -v fzf &>/dev/null; then
        local pod=$(kubectl get pods -o name | fzf --height 40% --reverse --prompt="Select Pod: " | sed 's/pod\///')
        if [[ -n $pod ]]; then
            kubectl exec -it $pod -- /bin/sh -c "bash || sh"
        fi
    else
        echo "📦 Install kubectl and fzf"
    fi
}

# AWS EC2 SSH Helper
ec2ssh() {
    if command -v aws &>/dev/null && command -v fzf &>/dev/null; then
        local instance=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0],State.Name,PublicIpAddress]' --output text | grep running | fzf --height 40% --reverse --prompt="Select Instance: ")
        if [[ -n $instance ]]; then
            local ip=$(echo $instance | awk '{print $4}')
            local name=$(echo $instance | awk '{print $2}')
            echo "🔐 Connecting to $name ($ip)..."
            ssh ec2-user@$ip
        fi
    else
        echo "📦 Install aws-cli and fzf"
    fi
}

# Cloud resource summary
cloudsum() {
    echo "╭─────────────────────────────────────────────────────────────╮"
    echo "│                  ☁️  CLOUD ENVIRONMENT                      │"
    echo "├─────────────────────────────────────────────────────────────┤"

    if [[ -n $AWS_PROFILE ]]; then
        echo "│ 🔶 AWS Profile: $AWS_PROFILE"
        [[ -n $AWS_REGION ]] && echo "│ 🌍 AWS Region: $AWS_REGION"
    fi

    if command -v kubectl &>/dev/null; then
        local ctx=$(kubectl config current-context 2>/dev/null)
        local ns=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
        [[ -n $ctx ]] && echo "│ ☸️  K8s Context: $ctx"
        [[ -n $ns ]] && echo "│ 📦 K8s Namespace: $ns"
    fi

    if command -v docker &>/dev/null && docker info &>/dev/null 2>&1; then
        local containers=$(docker ps -q | wc -l)
        local images=$(docker images -q | wc -l)
        echo "│ 🐳 Docker Containers: $containers running"
        echo "│ 📦 Docker Images: $images"
    fi

    if [[ -d .terraform ]]; then
        local workspace=$(terraform workspace show 2>/dev/null)
        [[ -n $workspace ]] && echo "│ 🏗️  Terraform Workspace: $workspace"
    fi

    echo "╰─────────────────────────────────────────────────────────────╯"
}

# Quick port check
portcheck() {
    local port=${1:-8080}
    if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null; then
        echo "⚠️  Port $port is in use by:"
        lsof -i :$port
    else
        echo "✅ Port $port is available"
    fi
}

# Kill process on port
killport() {
    local port=${1}
    if [[ -z $port ]]; then
        echo "Usage: killport <port>"
        return 1
    fi
    local pid=$(lsof -ti:$port)
    if [[ -n $pid ]]; then
        kill -9 $pid
        echo "✅ Killed process on port $port"
    else
        echo "❌ No process found on port $port"
    fi
}

# ═══════════════════════════════════════════════════════════════════
# 🎨 TERMINAL ENHANCEMENTS
# ═══════════════════════════════════════════════════════════════════

# Enhanced colors for ls and completion
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

# Terminal title
case "$TERM" in
    xterm*|rxvt*|screen*|tmux*)
        precmd() {
            print -Pnr -- $'\e]0;%n@%m: %~\a'
            if [[ "$new_line_before_prompt" == yes ]]; then
                if [[ -z "$_NEW_LINE_BEFORE_PROMPT" ]]; then
                    _NEW_LINE_BEFORE_PROMPT=1
                else
                    print ""
                fi
            fi
        }
        ;;
esac

new_line_before_prompt=yes

# ═══════════════════════════════════════════════════════════════════
# 🌟 ULTRA-MODERN STARTUP WELCOME MESSAGE
# ═══════════════════════════════════════════════════════════════════
if [[ -o interactive && -z "$TMUX" ]]; then
    clear
    print ""
    print -P "%F{051}================================================================%f"
    print -P "         %F{196}⚡%f %F{201}%BNICANOR KYAMBA%b%f %F{196}⚡%f"
    print -P "    %F{081}Software Engineer%f %F{240}|%f %F{046}Cloud Engineer%f %F{240}|%f %F{226}DevOps%f"
    print -P "%F{051}================================================================%f"
    print -P " %F{046}👋 Welcome back, Chief!%f"
    print -P " %F{081}📅 $(date '+%A, %B %d, %Y')%f"
    print -P " %F{226}⏰ $(date '+%I:%M:%S %p')%f"
    print -P " %F{196}🖥️  $(uname -n) | $(uname -s) $(uname -r | cut -d'-' -f1)%f"
    print -P "%F{051}================================================================%f"
    print -P " %F{214}☁️  AWS:%f ${AWS_PROFILE:-Not configured}"
    print -P " %F{039}☸  K8s:%f $(kubectl config current-context 2>/dev/null || echo 'Not configured')"
    print -P " %F{045}🐳 Docker:%f $(docker ps -q 2>/dev/null | wc -l) containers running"
    print -P "%F{051}================================================================%f"
    print ""
    print -P "%F{046}%B⚡ QUICK COMMANDS:%b%f"
    print -P "   %F{081}cloudsum%f      - Cloud environment status"
    print -P "   %F{081}awsswitch%f     - Switch AWS profile       %F{081}kswitch%f    - Switch K8s context"
    print -P "   %F{081}klogs%f         - View pod logs             %F{081}kshell%f     - Exec into pod"
    print -P "   %F{081}sysinfo%f       - System information        %F{081}gitsum%f     - Git repo summary"
    print ""
fi

# ═══════════════════════════════════════════════════════════════════
# 🎯 MODERN TERMINAL FEATURES
# ═══════════════════════════════════════════════════════════════════

# Enable advanced terminal features
if [[ "$TERM" == "xterm-256color" || "$TERM" == "screen-256color" ]]; then
    # Enable mouse support in terminal
    export MOUSE_SUPPORT=1

    # Better terminal title updates
    autoload -Uz add-zsh-hook

    function update_terminal_title() {
        local cmd="${1%% *}"
        case $TERM in
            xterm*|rxvt*|screen*|tmux*)
                print -Pn "\e]0;%n@%m: ${cmd:gs/%/%%}\a"
                ;;
        esac
    }

    add-zsh-hook preexec update_terminal_title
fi

# ═══════════════════════════════════════════════════════════════════
# 🎨 TERMINAL PROFILE & FONT CONFIGURATION
# ═══════════════════════════════════════════════════════════════════
[[ -f ~/.terminal_profile ]] && source ~/.terminal_profile

# ═══════════════════════════════════════════════════════════════════
# 🔧 ENVIRONMENT VARIABLES
# ═══════════════════════════════════════════════════════════════════
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export PAGER="less"
export MANPAGER="less -X"
export LESS="-R"
export GREP_COLOR="1;32"
export CLICOLOR=1

# Development environment
export NODE_ENV="development"
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

# Path enhancements
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# Modern terminal features
export COLORTERM="truecolor"
export TERM="xterm-256color"

# ═══════════════════════════════════════════════════════════════════
# 🎯 FINAL OPTIMIZATIONS
# ═══════════════════════════════════════════════════════════════════
unset color_prompt force_color_prompt

# Load local customizations if they exist
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# bun completions
[ -s "/home/nicanorkyamba/.bun/_bun" ] && source "/home/nicanorkyamba/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubectl completion
source <(kubectl completion zsh 2>/dev/null)
compdef __start_kubectl k

# ═══════════════════════════════════════════════════════════════════
# 🚀 SMART CD WITH AUTO LS
# ═══════════════════════════════════════════════════════════════════
chpwd() {
    emulate -L zsh
    ls --color=auto -lh
}

# Modern replacements
command -v bat &>/dev/null && alias cat='bat --style=plain'
command -v exa &>/dev/null && alias ls='exa --icons' && alias ll='exa -lah --icons' && alias tree='exa --tree --icons'

# Quick edits
alias zshrc='$EDITOR ~/.zshrc'
alias reload='source ~/.zshrc && echo "✅ Reloaded!"'

# ═══════════════════════════════════════════════════════════════════
# 💡 COMMAND NOT FOUND HANDLER
# ═══════════════════════════════════════════════════════════════════
command_not_found_handler() {
    echo "🚫 Command '$1' not found!"
    echo "💡 Did you mean one of these?"
    compgen -c | grep -i "^${1:0:3}" | head -5 | sed 's/^/   → /'
    return 127
}
