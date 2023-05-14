function __not_in_path
    if not contains $argv[1] $argv[2]; and not contains (realpath $argv[1]) $argv[2]
        return 0
    end
    return 1
end
