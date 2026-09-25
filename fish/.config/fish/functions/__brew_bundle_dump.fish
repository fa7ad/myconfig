function __brew_bundle_dump -d "Dump installed packages to ~/.Brewfile and sort it (taps first)"
    command brew bundle dump --force --global --no-vscode --no-describe
    set -l bf (realpath $HOME/.Brewfile)
    set -l temp (mktemp)
    grep '^tap' $bf | sort > $temp
    grep -v '^tap' $bf | sort >> $temp
    cat $temp > $bf
    unlink $temp
end
