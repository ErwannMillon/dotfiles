### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


### End of Zinit's installer chunk
#

SAVEHIST=100000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY    # Immediately append to history file
setopt SHARE_HISTORY        # Share history between sessions
## Alias
alias kdp='kubectl delete pod'
alias kkg="kubectl get pods"
alias kcx=kubectx
alias kkg="kubectl get pods"
alias kcx=kubectx
alias kk=kubectl
alias shrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias upi="uv pip install"
alias up="uv pip"
alias upir="uv pip install -r"

source ~/dotfiles/kubectl_aliases
execpod (){
	kk exec -it $1 -- bash
}
kkrep (){
	kk delete -f $1 --force && kk create -f $1
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/erwann/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/erwann/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/erwann/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/erwann/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
zinit ice depth=1

# Vim Mode
zinit light jeffreytse/zsh-vi-mode
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
source <(fzf --zsh)
zvm_after_init() {
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
}
zvm_after_init_commands+=("bindkey '^[[A' up-line-or-search" "bindkey '^[[B' down-line-or-search")


# Plug
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting




## Oh My Zsh Setting
ZSH_THEME="robbyrussell"

zi snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
# Must Load OMZ Git library

zi snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/async_prompt.zsh
zi snippet OMZL::git.zsh
zi snippet OMZP::git
zi snippet OMZL::functions.zsh

# Load Git plugin from OMZ
zi cdclear -q # <- forget completions provided up to this moment

setopt promptsubst
# Load Prompt
zi snippet OMZT::robbyrussell

UV_MANAGED_PYTHON=1
. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
