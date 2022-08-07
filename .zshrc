
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/eun2ce/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/eun2ce/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/eun2ce/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/eun2ce/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# microk8s
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config.microk8s 

if [ "${BASH-no}" != "no" ]; then
	[ -r ~/.bashrc ] && . ~/.bashrc
fi

# git
## Load vcs information
autoload -Uz vcs_info
precmd() { vcs_info }
## Format the vcs_info_msg_0_ variable
COLOR_DEF=$'\e[0m'
COLOR_GIT=$'\e[38;5;39m'
zstyle ':vcs_info:git:*' formats ${COLOR_GIT}'(%b)'${COLOR_DEF}
 
# Setup the prompt with git branch name
setopt PROMPT_SUBST
PROMPT='%n@${PWD/#$HOME/~} ${vcs_info_msg_0_} > '
