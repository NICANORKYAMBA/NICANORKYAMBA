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
