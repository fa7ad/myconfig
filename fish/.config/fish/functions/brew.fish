function brew -d "Wrapper function around homebrew to update brewfile automatically, made necessary since homebrew devs are dicks who prefer hacks over actually implementing features."
    command brew $argv
    if contains -- $argv[1] install uninstall remove rm upgrade autoremove tap untap
        __brew_bundle_dump
    end
end
