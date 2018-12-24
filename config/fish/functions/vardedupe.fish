function vardedupe --description 'Remove duplicates from environment variable'
  if test (count $argv) = 1
    set -l newvar
    for v in $$argv
      if not contains -- $v $newvar
        set newvar $newvar $v
      end
    end
    set $argv $newvar
  else
    for a in $argv
      vardedupe $a
    end
  end
end
