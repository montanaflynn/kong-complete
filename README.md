# Kong Complete

A Docker image that installs Java, Cassandra & Kong to be used for demos and benchmarks.

## Usage

```
# Build the image
docker build -t "montanaflynn/kong-complete" .

# Run the image in interactive mode
docker run -it montanaflynn/kong-complete bash

# Inside the container start cassandra and kong
cassandra
kong start
```
