#!/usr/bin/env fish

function _get_linkables
  echo * |sed 's/\s/\n/g'| egrep -v '^(\.git|config|INSTALL|LICENSE|README)'
end

# conf dir
set -l confdir $HOME
set -l files (string split \n (_get_linkables))

for file in $files
  ln -rsf $file $confdif/.$file
done

for conf in config/*
  if [ -d "${confdir}/.${conf}" ]
    echo backing up $conf to $conf'.bak'
    mv $confdir/.$conf $confdir/.$conf.bak
  fi

  ln -rs ./$conf $confdir/.$conf
done

