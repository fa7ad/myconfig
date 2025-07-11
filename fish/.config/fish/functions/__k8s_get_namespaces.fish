function __k8s_get_namespaces -d "Get Kubernetes namespaces for completion"
    kubectl get namespaces -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' 2>/dev/null
end
