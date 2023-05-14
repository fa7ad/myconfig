function __should_add_to_path
    if __does_path_exist $argv[1]; and __is_path_absolute $argv[1]; and __not_in_path $argv[1] $argv[2]
        return 0
    end
    return 1
end
