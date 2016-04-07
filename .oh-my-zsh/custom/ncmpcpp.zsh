ncm() {
  if ps aux | grep mpd >/dev/null; then
    ncmpcpp
  else
    echo "MPD is not running..."
    exit 1
  fi
}
