# ============================================================================
# High-Performance .zshrc Configuration
# ============================================================================
# Optimized for speed, maintainability, and modern zsh best practices

# Optional: Enable profiling (uncomment to measure startup time)
# zmodload zsh/zprof

# ============================================================================
# Powerlevel10k Instant Prompt (Ultra-fast startup)
# ============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# Oh-My-Zsh Configuration (Optimized)
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"

# High-performance theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Terminal configuration
export TERM="xterm-256color"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Performance optimizations
DISABLE_AUTO_UPDATE="true"  # Manual updates for faster startup
ZSH_DOTENV_PROMPT=false

# Streamlined plugin list (removed redundant/slow plugins)
plugins=(
  git                     # Essential git aliases and functions
  macos                   # macOS-specific commands
  zsh-autosuggestions     # Fish-like autosuggestions
  zsh-syntax-highlighting # Syntax highlighting (add this if not installed)
)

source $ZSH/oh-my-zsh.sh

# ============================================================================
# PATH Configuration (Optimized with deduplication)
# ============================================================================
# Use typeset -U to automatically remove duplicates
typeset -U path

# Build path array efficiently
path=(
  "$HOME/.local/bin"
  "$HOME/Library/pnpm"
  "/opt/homebrew/opt/postgresql@16/bin"
  $path  # Preserve existing PATH
)

# PNPM configuration
export PNPM_HOME="$HOME/Library/pnpm"

# ============================================================================
# Mise Configuration (Simplified & Fast)
# ============================================================================
# Much cleaner than the original verbose setup
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# ============================================================================
# Text Processing Configuration (Preserved - Excellent Setup)
# ============================================================================
# Better defaults for GNU less
# See: https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# ============================================================================
# Aliases (Essential Only)
# ============================================================================
# Configuration
alias zshconfig="$EDITOR ~/.zshrc"
alias zshreload="source ~/.zshrc"

# Terminal & Navigation
alias t="tmux new-session -A -s main"
alias l.="ll -f"
alias lf="ls -alF"

# Text processing
alias grep="grep --color"

# Git (supplementary to git plugin)
alias gs="git status"
alias gc="git commit -m"
alias glog="git log --oneline --graph"
alias glogg="git log --oneline --graph --simplify-by-decoration --all"
alias gpo="git push origin"
alias grevert="git checkout --"

# Safety aliases (optional - remove if they slow your workflow)
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# ============================================================================
# Performance Optimizations
# ============================================================================
# Lazy loading for heavy commands (uncomment if you use rbenv)
# rbenv() {
#   unfunction rbenv
#   eval "$(command rbenv init -)"
#   rbenv "$@"
# }

# ============================================================================
# Powerlevel10k Configuration
# ============================================================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# Performance Profiling (Uncomment to measure startup time)
# ============================================================================
# zprof

# Needs to be at end
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
