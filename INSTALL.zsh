#!/usr/bin/env zsh
# conf dir
confdir="${ZDOTDIR:-$HOME}"

setopt EXTENDED_GLOB
for rcfile in ^(.git|config|INSTALL|LICENSE|README)*; do
  ln -rsf "./${rcfile}" "${confdir}/.${rcfile:t}"
done

for conf in config/*; do
  if [ -d "${confdir}/.${conf}" ]; then
    echo "backing up ${conf} to ${conf}.bak"
    mv "${confdir}/.${conf}" "${confdir}/.${conf}.bak"
  fi

  ln -rs "./${conf}" "${confdir}/.${conf}"
done

unsetopt EXTENDED_GLOB
