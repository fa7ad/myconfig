function yta
  mpv --no-vid --ytdl-format=bestaudio "ytdl://ytsearch:$argv"
end
