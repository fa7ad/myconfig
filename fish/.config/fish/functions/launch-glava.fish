function get_window_geom
  xdotool getwindowgeometry $argv[1]
end

function launch-glava
  if [ -z (pidof glava) ]
    glava &
    disown
  end
  sleep 2
  set _id (xdotool getactivewindow)
  set geom (xdotool getwindowgeometry $_id)
  set pos (printf "%s" $geom | sed -r 's/.*Position:\s([0-9]+),([0-9]+).*/\1 \2/g')
  set _size (printf "%s" $geom | sed -r 's/.*Geometry:\s([0-9]+)x([0-9]+).*/\1 \2/g')
  set size (string split " " -- $_size)
  set gla (xdotool search --class GLava)
  eval (echo xdotool windowmove $gla $pos)
  eval (echo xdotool windowsize $gla $size[1] (math $size[2] \* 0.8))
end
