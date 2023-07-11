function brew -d "Wrapper function around homebrew to update brewfile automatically, made necessary since homebrew devs are dicks who prefer hacks over actually implementing features."
    command brew $argv
    if contains install $argv; or contains remove $argv; or contains upgrade $argv
        command brew bundle dump --force --global
        set -l sorted (sed -i '' '/^vscode.*$/d' (realpath $HOME/.Brewfile) | sort) #sorted for easier diffing
        set -l temp (mktemp)
        grep ^tap (echo $sorted | psub -f) > $temp
        grep -v ^tap (echo $sorted | psub -f) >> $temp
        cat $temp > (realpath $HOME/.Brewfile)
        unlink $temp
    end
end
