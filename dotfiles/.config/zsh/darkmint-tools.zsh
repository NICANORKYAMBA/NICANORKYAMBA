# DarkMint terminal power-ups. Sourced from ~/.zshrc; every block is skipped
# if its tool isn't installed, so this file is safe on a fresh machine.

# ─── eza: ls with icons + git status ───
if (( $+commands[eza] )); then
    alias ls='eza --icons=auto --group-directories-first'
    alias ll='eza -laF --icons=auto --group-directories-first --time-style=long-iso --git'
    alias la='eza -a --icons=auto --group-directories-first'
    alias lt='eza -la --icons=auto --sort=modified'
    alias tree='eza --tree --level=2 --icons=auto --group-directories-first'
fi

# ─── bat: cat with syntax highlighting (plain output when piped) ───
if (( $+commands[batcat] )) && ! (( $+commands[bat] )); then
    alias bat='batcat'
fi
if (( $+commands[bat] || $+commands[batcat] )); then
    export BAT_THEME='Visual Studio Dark+'
    alias cat='bat --paging=never --style=plain'
    alias catn='bat --paging=never'          # with line numbers + git gutter
    export MANPAGER="sh -c 'col -bx | ${commands[batcat]:-bat} -l man -p'"
    export MANROFFOPT='-c'
fi

# ─── fzf: fuzzy finder with DarkMint colors ───
#   Ctrl+R history · Ctrl+T files · Alt+C cd into dir
if (( $+commands[fzf] )); then
    export FZF_DEFAULT_OPTS="--height 45% --layout=reverse --border=rounded --info=inline \
--prompt='❯ ' --pointer='▶' --marker='✓' \
--color=bg+:#133D17,fg:#c9d6cc,fg+:#f2fff4,hl:#39d98a,hl+:#5dffa8 \
--color=border:#1f3324,prompt:#39d98a,pointer:#5dffa8,marker:#2ee6c5,info:#4a6b52,header:#2ee6c5,spinner:#5dffa8"
    if (( $+commands[fd] || $+commands[fdfind] )); then
        export FZF_DEFAULT_COMMAND="${commands[fd]:-${commands[fdfind]}} --type f --hidden --exclude .git"
        export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
    fi
    if (( $+commands[bat] || $+commands[batcat] )); then
        export FZF_CTRL_T_OPTS="--preview '${commands[batcat]:-bat} --color=always --style=numbers --line-range=:200 {}'"
    fi
    source <(fzf --zsh 2>/dev/null)
fi

# ─── zoxide: `z proj` jumps to your most-used matching directory ───
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# ─── fastfetch: `ff` for a full system card ───
(( $+commands[fastfetch] )) && alias ff='fastfetch'

# ─── Welcome banner: DarkMint redesign (set DARKMINT_BANNER=classic for the original) ───
if [[ ${DARKMINT_BANNER:-darkmint} != classic ]]; then
_zsh_welcome_banner() {
    emulate -L zsh
    [[ -o interactive && -z $TMUX ]] || return

    local kernel=""
    read -r kernel < /proc/sys/kernel/osrelease 2>/dev/null

    local kube_ctx="" line
    local kubecfg="${KUBECONFIG:-$HOME/.kube/config}"
    if [[ -r $kubecfg ]]; then
        while read -r line; do
            if [[ $line == current-context:* ]]; then
                kube_ctx=${${line#current-context:}## }
                break
            fi
        done < $kubecfg
    fi

    local docker_info=""
    [[ -r $_ZSH_PCACHE/docker ]] && docker_info=$(<$_ZSH_PCACHE/docker)
    setopt localoptions extendedglob
    docker_info=${docker_info//🐳/}
    docker_info=${docker_info//\%(F\{[^\}]##\}|[fBb])/}   # drop the prompt cache's own colors

    # DarkMint palette
    local A='%F{#39d98a}' N='%F{#5dffa8}' T='%F{#c9d6cc}' D='%F{#4a6b52}' C='%F{#2ee6c5}' R='%f'
    local bar="${A}▌${R}"

    clear
    print ""
    print -P "  ${bar} ${N}%BNICANOR KYAMBA%b${R}"
    print -P "  ${bar} ${A}Software Engineer ${D}·${A} Cloud Engineer ${D}·${A} DevOps${R}"
    print -P "  ${bar}"
    print -P "  ${bar} ${A}󰌢${R} ${T}${HOST}${R}  ${D}·${R}  ${T}Linux ${kernel%%-*}${R}  ${D}·${R}  ${T}%D{%A %d %b}${R}  ${D}·${R}  ${N}%D{%H:%M}${R}"
    print -P "  ${bar} ${A}󰸏${R} ${D}aws${R} ${T}${AWS_PROFILE:-default}${R}   ${A}󱃾${R} ${D}k8s${R} ${C}${kube_ctx:-none}${R}   ${A}󰡨${R} ${D}docker${R} ${T}${docker_info:-none}${R}"
    print ""
    print -P "  ${D}cmds${R}  ${C}cloudsum${R} ${D}·${R} ${C}awsswitch${R} ${D}·${R} ${C}kswitch${R} ${D}·${R} ${C}klogs${R} ${D}·${R} ${C}kshell${R} ${D}·${R} ${C}sysinfo${R} ${D}·${R} ${C}gitsum${R} ${D}·${R} ${C}ff${R}"
    print ""
}
fi
