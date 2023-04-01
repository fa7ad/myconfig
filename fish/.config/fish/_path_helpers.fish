function path_is_absolute
  string match -r -q '^/' $argv; and return 0; or return 1
end

function path_not_in
  if not contains $argv[1] $argv[2]; and not contains (realpath $argv[1]) $argv[2]
    return 0
  end
  return 1
end

function path_exists
  test -e $argv; and return 0; or return 1
end

function should_add_path
  if path_exists $argv[1]; and path_is_absolute $argv[1]; and path_not_in $argv[1] $argv[2]
    return 0
  end
  return 1
end

