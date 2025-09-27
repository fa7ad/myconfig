function gi
	curl -sL "https://www.toptal.com/developers/gitignore/api/$argv" | sed -e '1,3d;$d' -e ':a' -e '/^\n*$/{$d;N;};/\n$/ba'
end
