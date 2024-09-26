#! /bin/env bash

# Download the docker file
curl -L https://raw.githubusercontent.com/thesfinox/aiphy-intro-ml-homework/refs/heads/main/aiphyintroml.dockerfile >| /tmp/aiphyintroml.dockerfile

# Build and run the Docker image
docker build --pull --rm -f "/tmp/aiphyintroml.dockerfile" -t aiphyintroml:latest "."
docker run -p 8888:8888 --rm -it  aiphyintroml:latest
