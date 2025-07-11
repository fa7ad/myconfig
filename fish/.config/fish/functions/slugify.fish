function slugify -d "Convert command string to safe filename"
    set -l input "$argv[1]"

    # Define flags to strip
    set -l noisy_flags --verbose --debug --dry-run --quiet --silent --force --yes --no-interaction --ansi --no-ansi -v -q -f -y

    # Build dynamic sed script
    set -l sed_script ""
    for flag in $noisy_flags
        set sed_script "$sed_script s/"$flag"[[:alnum:]=+._-]+//g;"
    end
    set sed_script "$sed_script"' s/[[:space:]]+/ /g;
        s/^(php( public\/index\.php)?|node|python[0-9]*|bash|sh|zsh|fish|docker)[[:space:]]+//;
        s/[^[:alnum:]+._-]+/_/g;
        s/_+$//;'

    # Apply in one sed call
    set -l filename (echo "$input" | sed -E "$sed_script")

    if test -z "$filename"
        set filename command
    end

    echo "$filename" | cut -c1-72
end
