IMAGE_NAME=bash-linux-monitor

.PHONY: run test lint build docker-run clean

run:
	./bin/monitor.sh

test:
	./tests/test_monitor.sh

lint:
	shellcheck -x bin/*.sh lib/*.sh tests/*.sh

build:
	docker build -t $(IMAGE_NAME) .

docker-run:
	docker run --rm $(IMAGE_NAME)

clean:
	rm -f logs/*.log