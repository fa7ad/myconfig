function nerdctl -d "stub nerdctl"
  set -l dargv
  for arg in $argv
    if [ $arg = "--namespace" ]; or [ $arg = "k8s.io" ]
      continue
    end
    set dargv $dargv $arg
  end
  echo docker $dargv
  docker $dargv
end
