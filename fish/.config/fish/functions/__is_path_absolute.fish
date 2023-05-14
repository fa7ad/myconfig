function __is_path_absolute -d "Checks if the supplied path is an absolute path"
    string match -r -q '^/' $argv; and return 0; or return 1
end
