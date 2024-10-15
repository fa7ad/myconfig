set dockercmd nerdctl
# ------------------------------------
# Docker abbr and function
# ------------------------------------

# Get latest container ID
abbr dl "$dockercmd ps -l -q"

# Get container process
abbr dps "$dockercmd ps"

# Get process included stop container
abbr dpa "$dockercmd ps -a"

# Get images
abbr di "$dockercmd images"

# Get container IP
abbr dip "$dockercmd inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
abbr dkd "$dockercmd run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
abbr dki "$dockercmd run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
abbr dex "$dockercmd exec -i -t"

# Stop all containers
abbr dstop "$dockercmd stop ($dockercmd ps -a -q)"

# Remove all containers
abbr drm "$dockercmd rm ($dockercmd ps -a -q)"

# Stop and Remove all containers
abbr drmf "$dockercmd stop ($dockercmd ps -a -q); and $dockercmd rm ($dockercmd ps -a -q)"

# Remove all images
abbr dri "$dockercmd rmi ($dockercmd images -q)"

# Dockerfile build, e.g., $dbu tcnksm/test
abbr dbu "$dockercmd build -t=(basename $PWD) ."

# Bash into running container
abbr dbash '$dockercmd exec -it ($dockercmd ps -aqf "name "(basename $PWD)) bash'

abbr dcup "$dockercmd compose up"

abbr dcd "$dockercmd compose down"

abbr dce "$dockercmd compose exec"

abbr dcl "$dockercmd compose logs -f"

abbr dc "$dockercmd compose"
