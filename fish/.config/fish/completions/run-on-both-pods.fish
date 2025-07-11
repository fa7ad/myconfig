# Completions for run-on-both-pods function
complete -c run-on-both-pods -f

# Complete namespace (1st argument)
complete -c run-on-both-pods -n "not __fish_seen_subcommand_from (__k8s_get_namespaces)" -a '(__k8s_get_namespaces)'

# Complete first pod name (2nd argument)
complete -c run-on-both-pods -n "__fish_seen_subcommand_from (__k8s_get_namespaces); and test (count (commandline -opc)) -eq 2" -a '(__k8s_get_pods (commandline -opc)[2])'

# Complete second pod name (3rd argument)  
complete -c run-on-both-pods -n "__fish_seen_subcommand_from (__k8s_get_namespaces); and test (count (commandline -opc)) -eq 3" -a '(__k8s_get_pods (commandline -opc)[2])'

# Complete container name (4th argument)
complete -c run-on-both-pods -n "__fish_seen_subcommand_from (__k8s_get_namespaces); and test (count (commandline -opc)) -eq 4" -a '(__k8s_get_containers (commandline -opc)[2] (commandline -opc)[3])'
