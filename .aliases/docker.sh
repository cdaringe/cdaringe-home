alias docker-cleanup="docker run -d -v /var/run/docker.sock:/var/run/docker.sock:rw -v /var/lib/docker:/var/lib/docker:rw --env KEEP_IMAGES='ubuntu:trusty, ubuntu:latest, node, node:slim' meltwater/docker-cleanup:latest"