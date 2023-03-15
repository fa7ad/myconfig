function ssh-mount -d "Mount a remote ssh path as a local volume" -a sshUrl remotePath volName
  set -l mount_path "$HOME/Volumes/$volName"
  mkdir -p $mount_path
  sshfs $sshUrl:$remotePath $mount_path
  and open $mount_path
end
