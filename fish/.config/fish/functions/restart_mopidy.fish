function restart_mopidy
  killall mopidy
  sleep 3; and mopidy &
  disown
end

