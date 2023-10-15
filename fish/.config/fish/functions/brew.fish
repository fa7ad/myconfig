function brew -d "Wrapper function around homebrew to update brewfile automatically, made necessary since homebrew devs are dicks who prefer hacks over actually implementing features."
    command brew $argv
    if contains install $argv; or contains remove $argv; or contains upgrade $argv
        command brew bundle dump --force --global
        set -l bf (realpath $HOME/.Brewfile)
        set -l sorted (cat $bf | sort | grep -Ev '^vscode')
        set -l temp (mktemp)

        for line in $sorted
          if string match -r '^tap' $line > /dev/null
            echo $line >> $temp
          end
        end
        for line in $sorted
          if not string match -r '^tap' $line > /dev/null
            echo $line >> $temp
          end
        end
        cat $temp > $bf
        unlink $temp
    end
end
