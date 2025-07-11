function run-on-pod -d "Run command interactively on a Kubernetes pod"
    set -l namespace $argv[1]
    set -l pod_name $argv[2]
    set -l container $argv[3]
    set -l command $argv[4..]

    if test (count $argv) -lt 4
        echo "Usage: run-on-pod <namespace> <pod> <container> <command...>"
        return 1
    end

    unbuffer kubectl exec -it -n "$namespace" "$pod_name" -c "$container" -- $command
end
