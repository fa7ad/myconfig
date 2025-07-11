function __k8s_get_pods -d "Get Kubernetes pods for completion"
    set -l namespace $argv[1]
    if test -n "$namespace"
        kubectl get pods -n "$namespace" -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' 2>/dev/null
    else
        kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' 2>/dev/null
    end
end
