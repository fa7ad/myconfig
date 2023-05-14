function __does_path_exist
    test -e $argv; and return 0; or return 1
end
