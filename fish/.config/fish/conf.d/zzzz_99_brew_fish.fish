if ! set -q HOMEBREW_PREFIX
  echo "HOMEBREW_PREFIX not set"
  exit 1
end

if test -d $HOMEBREW_PREFIX"/share/fish/completions"
    set -p fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end

if test -d $HOMEBREW_PREFIX"/share/fish/vendor_completions.d"
    set -p fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
end
