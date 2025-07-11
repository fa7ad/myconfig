# Completions for run-on-pod function
complete -c run-on-pod -f

# Complete namespace (1st argument)
complete -c run-on-pod -n "not __fish_seen_subcommand_from (__k8s_get_namespaces)" -a '(__k8s_get_namespaces)'

# Complete pod name (2nd argument) 
complete -c run-on-pod -n "__fish_seen_subcommand_from (__k8s_get_namespaces); and test (count (commandline -opc)) -eq 2" -a '(__k8s_get_pods (commandline -opc)[2])'

# Complete container name (3rd argument)
complete -c run-on-pod -n "__fish_seen_subcommand_from (__k8s_get_namespaces); and test (count (commandline -opc)) -eq 3" -a '(__k8s_get_containers (commandline -opc)[2] (commandline -opc)[3])'
