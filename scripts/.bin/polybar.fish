#!/usr/bin/env fish

killall polybar ^ /dev/null
for m in (polybar -m | cut -d\: -f1)
  env MONITOR=$m polybar top ^ /dev/null &
  disown
end
