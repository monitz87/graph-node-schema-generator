# Full Schema Generator

The entire purpose of this fork is to be a workaround for this issue: https://github.com/graphprotocol/graph-node/issues/4710

I'll try to keep it up to date with upstream, and I'll probably do as long as I keep using The Graph (or until they provide this functionality via the CLI).

# Usage

The schema generator is built from a modified version of the script located at `graphql/examples/schema.rs`. It is Dockerized and can be found [here](https://hub.docker.com/repository/docker/monitz87/graphprotocol-schema-generator/general)

To run it, you just need to do

`docker run --rm monitz87/graphprotocol-schema-generator:latest "$(cat PATH_TO_SCHEMA_FILE)"` and it will print the full schema to stdout

# Building the image

- Multi-platform: `docker buildx build --platform linux/amd64,linux/arm64/v8 . -f schema-generator.Dockerfile -t <TAG> --push`
