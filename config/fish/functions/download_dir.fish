function download_dir
  set nslash (echo $argv[1] | perl -pe 's|.*://[^/]+(.*?)/?$|\1|' | grep -o / | wc -l)
  if [ $nslash -gt 0 ]
    set ncut (math $nslash - 1)
  else
    set ncut 0
  end
  wget -r -nH --cut-dirs=$ncut --no-parent --reject="index.html*" $argv[1]
end
