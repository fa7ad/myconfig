function __k8s_get_containers -d "Get containers for a specific pod"
    set -l namespace $argv[1]
    set -l pod $argv[2]
    if test -n "$namespace" -a -n "$pod"
        kubectl get pod -n "$namespace" "$pod" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' 2>/dev/null
    end
end
