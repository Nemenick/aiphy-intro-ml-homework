#! /bin/env bash

# Build and run the Docker image
docker build --pull --rm -f "aiphyintroml.dockerfile" -t aiphyintroml:latest "."
docker run -p 8888:8888 --rm -it  aiphyintroml:latest
