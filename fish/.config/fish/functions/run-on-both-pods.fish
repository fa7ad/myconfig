function run-on-both-pods -d "Run command on two pods and save filtered output"
    set -l namespace $argv[1]
    set -l pod1 $argv[2]
    set -l pod2 $argv[3]
    set -l container $argv[4]
    set -l command $argv[5..]

    if test (count $argv) -lt 5
        echo "Usage: run-on-both-pods <namespace> <pod1> <pod2> <container> <command...>"
        return 1
    end

    # Generate filename using slugify
    set -l command_str (string join " " "$command")
    set -l slug (slugify "$command_str")
    set -l timestamp (date +%Y%m%d_%H%M%S)

    # Create output directory if it doesn't exist
    set -l output_dir "$HOME/k8s-logs"
    mkdir -p "$output_dir"

    # Generate filenames
    set -l file1 "$output_dir/"$pod1"_"$slug"_"$timestamp".log"
    set -l file2 "$output_dir/"$pod2"_"$slug"_"$timestamp".log"

    echo "Running command on both pods..."
    echo "Command: $command_str"
    echo "Saving logs to:"
    echo "  Pod1 ($pod1): $file1"
    echo "  Pod2 ($pod2): $file2"

    # Run command on first pod, filter ANSI escape sequences
    echo "Executing on $pod1..."
    run-on-pod "$namespace" "$pod1" "$container" $command 2>&1 | ansifilter | tee "$file1"

    # Run command on second pod, filter ANSI escape sequences
    echo "Executing on $pod2..."
    run-on-pod "$namespace" "$pod2" "$container" $command 2>&1 | ansifilter | tee "$file2"

    echo "Logs saved. You can compare them with:"
    echo "  diff '$file1' '$file2'"
    echo "or"
    echo "  code --diff '$file1' '$file2'"
end
