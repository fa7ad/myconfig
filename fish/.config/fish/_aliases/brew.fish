# Wrapper function around homebrew to update brewfile automatically, made
# necessary since homebrew devs are dicks who prefer hacks over actually 
# implementing features.

function brew
  command brew $argv
  if contains install $argv; or contains remove $argv
    command brew bundle dump --force --global
  end
end
