# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Disable brew attestations
BREW_VERIFY_ATTESTATIONS=false

# Config paths environment variables
export XDG_CONFIG_HOME="$HOME/.config"
export LAZYGIT_CONFIG_PATH="$HOME/.config/lazygit/config.yml"

# oh my zsh!
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Terminal essentials aliases
alias c="clear"
alias e="exit"
alias ls="lsd"
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Linux aliases
alias sz="source ~/.zshrc"

# Python aliases
alias py="python"

# Nvim
alias v='nvim'
alias code='nvim'
alias nvc='~/.dotfiles/.config/nvim'
export EDITOR="nvim"
export VISUAL="nvim"

# Git aliases
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git log'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'

# Tmux aliases
alias t='tmux'
alias tls='tmux ls'
alias tns='tmux new -s'
alias tks='tmux kill-session'
alias tks!='tmux kill-server'
alias tkow='tmux kill-window -a > /dev/null'
alias tkop='tmux kill-pane -a > /dev/null'
alias tko='{tkop && tkow} > /dev/null'
alias tjp='tmux join-pane -t'
alias tsw='tmux swap-window -t'

# Lazygit aliases
alias lg='lazygit'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fzf - Fuzzy find directories from current directory and cd into it
f() {
    local dir
    dir=$(fd ${1:-.} --type d 2> /dev/null | fzf-tmux +m) && cd "$dir"
}

# Zoxide - Better cd command
eval "$(zoxide init --cmd cd zsh)"

# Yazi - CLI file explorer
y() {
  tmpfile=$(mktemp)
  yazi --cwd-file="$tmpfile" "$@"
  if [ -s "$tmpfile" ]; then
    cd "$(cat "$tmpfile")"
  fi
  rm -f "$tmpfile"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

