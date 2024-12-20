# Usage: make [command]
SHELL:=/bin/bash
WORKSPACE=$(shell pwd)
WORKSPACE_ROOT_DIR=$(shell basename $(WORKSPACE))
DOCKERFILE=docker/Dockerfile
LABEL=genesis_docker
IMAGE_TAG=latest

setup_docker:
	docker build -t ${LABEL}_image:${IMAGE_TAG} -f ${DOCKERFILE} . --no-cache

exec_docker:
	docker exec -it ${LABEL}_container ${SHELL}

run_rocker:
	rocker --nvidia --x11 --user --network host --privileged --nocleanup --volume .:/home/$(shell whoami)/${WORKSPACE_ROOT_DIR} --name ${LABEL}_container ${LABEL}_image:${IMAGE_TAG}

run_docker:
	@if [ "$(shell docker inspect --format='{{.State.Status}}' ${LABEL}_container)" = "running" ]; then \
		$(MAKE) exec_docker; \
	elif [ "$(shell docker inspect --format='{{.State.Status}}' ${LABEL}_container)" = "exited" ]; then \
		docker start ${LABEL}_container; \
		if [$? -eq 0]; then \
			$(MAKE) exec_docker; \
		else \
			docker rm ${LABEL}_container; \
			$(MAKE) run_rocker; \
		fi; \
	else \
		$(MAKE) run_rocker; \
	fi

clean:
	rm -r build install log
