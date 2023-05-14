# ------------------------------------
# Docker abbr and function
# ------------------------------------

# Get latest container ID
abbr dl "docker ps -l -q"

# Get container process
abbr dps "docker ps"

# Get process included stop container
abbr dpa "docker ps -a"

# Get images
abbr di "docker images"

# Get container IP
abbr dip "docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
abbr dkd "docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
abbr dki "docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
abbr dex "docker exec -i -t"

# Stop all containers
abbr dstop "docker stop (docker ps -a -q)"

# Remove all containers
abbr drm "docker rm (docker ps -a -q)"

# Stop and Remove all containers
abbr drmf 'docker stop (docker ps -a -q); and docker rm (docker ps -a -q)'

# Remove all images
abbr dri "docker rmi (docker images -q)"

# Dockerfile build, e.g., $dbu tcnksm/test
abbr dbu "docker build -t=(basename $PWD) ."

# Bash into running container
abbr dbash 'docker exec -it (docker ps -aqf "name "(basename $PWD)) bash'

abbr dcup 'docker compose up'

abbr dcd 'docker compose down'

abbr dce 'docker compose exec'

abbr dcl 'docker compose logs -f'

abbr dc 'docker compose'