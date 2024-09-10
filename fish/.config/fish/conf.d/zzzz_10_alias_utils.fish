# not really an abbreviation xD
abbr catcat bat

abbr bll 'bat -pl json'

# neither is this
abbr rimraf 'rm -rf'

# tree
alias tree='tree -I "node_modules|bower_components"'

# kubectl
abbr k kubectl
abbr kstg 'kubectl -n realtime-staging'
abbr kprod 'kubectl -n realtime-production'
# terraform
abbr tf terraform
# nerdctl
abbr n nerdctl

function kv
  nerdctl run --rm -v ~/.kube:/.kube --name kubectl-$argv[1] bitnami/kubectl:$argv[1] $argv[2..-1]
end

# vim
alias vim_clear_cache='rm -rf ~/.vim{backup,swap,undo,views}'

# Obvious short hands
alias cls='clear'
abbr sshx 'ssh -X'

function mkcd
    mkdir -p $argv
    cd $argv
end

# LS
alias ls='gls --group-directories-first --color=auto'
alias l='ls -lFh'
alias la='ll -lAFh'
alias ll='ls -lh'
alias lsa='ls -lah'

alias vim='nvim'

alias python='python3'
