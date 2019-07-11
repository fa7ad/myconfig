#!/usr/bin/env fish

killall polybar ^ /dev/null
for m in (polybar --list-monitors | cut -d":" -f1)
  env MONITOR=$m polybar --reload top &
end
