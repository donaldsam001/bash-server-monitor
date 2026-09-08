# Bash Linux System Monitor

A lightweight Linux system monitoring CLI built with Bash.

The project collects basic Linux system metrics such as CPU, memory, disk usage, uptime, and running processes. It also provides logging, automated tests, ShellCheck validation, Docker packaging, and GitHub Actions CI.

The goal of this project is to demonstrate practical Bash and DevOps skills through a small but production-oriented automation project.

## Architecture

```text
                    Developer
                        |
                        | git push
                        v
                +---------------+
                |    GitHub     |
                +-------+-------+
                        |
                        v
                +---------------+
                | GitHub Actions|
                +-------+-------+
                        |
             +----------+----------+
             |          |          |
             v          v          v
        ShellCheck    Tests    Docker Build
             |          |          |
             +----------+----------+
                        |
                       PASS
```

## Features

* CPU usage monitoring
* Memory usage monitoring
* Disk usage monitoring
* System uptime information
* Top process information
* Configurable resource thresholds
* Structured logging
* CLI commands
* Bash automated tests
* ShellCheck static analysis
* Docker image
* GitHub Actions CI pipeline
* Makefile automation

## Project Structure

```text
bash-linux-system-monitor/
│
├── bin/
│   └── monitor.sh
│
├── lib/
│   ├── cpu.sh
│   ├── memory.sh
│   ├── disk.sh
│   ├── process.sh
│   └── logger.sh
│
├── config/
│   └── monitor.conf
│
├── tests/
│   └── test_monitor.sh
│
├── logs/
│   └── .gitkeep
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── Dockerfile
├── .dockerignore
├── Makefile
└── README.md
```

## Requirements

For local execution:

* Linux
* Bash
* coreutils
* procps
* awk
* Git

For container execution:

* Docker

For CI:

* GitHub Actions
* ShellCheck

## Installation

Clone the repository:

```bash
git clone <repository-url>
cd bash-linux-system-monitor
```

Make the scripts executable:

```bash
chmod +x bin/monitor.sh
chmod +x tests/test_monitor.sh
```

## Usage

Show the complete system status:

```bash
./bin/monitor.sh status
```

Check CPU:

```bash
./bin/monitor.sh cpu
```

Check memory:

```bash
./bin/monitor.sh memory
```

Check disk:

```bash
./bin/monitor.sh disk
```

Show top processes:

```bash
./bin/monitor.sh processes
```

View logs:

```bash
./bin/monitor.sh logs
```

Show help:

```bash
./bin/monitor.sh help
```

## Configuration

Thresholds are stored in:

```text
config/monitor.conf
```

Example:

```bash
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

LOG_FILE="./logs/monitor.log"
```

These values can be changed without modifying the monitoring logic.

## Makefile

The project provides common development commands.

Run the application:

```bash
make run
```

Run tests:

```bash
make test
```

Run ShellCheck:

```bash
make lint
```

Build the Docker image:

```bash
make build
```

Run the Docker container:

```bash
make docker-run
```

## Docker

Build the image:

```bash
docker build -t bash-linux-monitor .
```

Run the container:

```bash
docker run --rm bash-linux-monitor
```

Docker is used to package the monitoring application and its runtime dependencies into a reproducible environment.

## Testing

Run:

```bash
./tests/test_monitor.sh
```

The tests verify that the monitoring functions return valid values for:

* CPU
* Memory
* Disk

## Static Analysis

ShellCheck is used to detect common Bash problems.

Run:

```bash
shellcheck bin/*.sh
shellcheck lib/*.sh
shellcheck tests/*.sh
```

## CI Pipeline

Every push and pull request triggers GitHub Actions.

```text
git push
    |
    v
GitHub Actions
    |
    v
ShellCheck
    |
    v
Tests
    |
    v
Docker Build
    |
    v
Pipeline Passed
```

The pipeline prevents code with shell syntax and common Bash problems from being accepted without validation.

## DevOps Skills Demonstrated

This project demonstrates practical experience with:

* Bash scripting
* Linux system administration
* Linux process and resource monitoring
* ShellCheck
* Automated testing
* Docker
* Git
* GitHub
* GitHub Actions
* CI pipelines
* Makefile automation
* Configuration management
* Logging
* CLI development

## Future Improvements

Possible future improvements include:

* Continuous monitoring mode
* systemd service
* Cron-based monitoring
* Alerting
* JSON output
* Prometheus-compatible metrics
* Docker image publishing
* Release automation
* Test coverage improvements

## Project Goal

This project was created as a practical DevOps portfolio project to demonstrate how Bash automation can be combined with Linux, Docker, testing, and CI/CD practices.

The focus is not only on writing shell scripts, but also on applying software engineering and DevOps practices around those scripts.
