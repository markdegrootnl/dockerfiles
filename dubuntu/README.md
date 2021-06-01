# Dubuntu

Simple Dockerfile to spin up a Ubuntu container with some packages installed.

## Usage

Run the container:

```bash
docker run -it --rm -v "$PWD":/work -w /work dubuntu:20.04
```

Or add it as an alias to your shell by adding the line below to your bash/dash/zsh profile:
```bash
alias dubuntu='docker run -it --rm -v "$PWD":/work -w /work ubuntu:20.04'
```

## Building

Build the container using:
```bash
docker build -t dubuntu:20.04 .
```
