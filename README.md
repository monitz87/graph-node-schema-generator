# Full Schema Generator

The entire purpose of this fork is to be a workaround for this issue: https://github.com/graphprotocol/graph-node/issues/4710

I'll try to keep it up to date with upstream, and I'll probably do as long as I keep using The Graph (or until they provide this functionality via the CLI).

# Usage

The schema generator is built from a modified version of the script located at `graphql/examples/schema.rs`. It is Dockerized and can be found [here](https://hub.docker.com/repository/docker/monitz87/graphprotocol-schema-generator/general)

To run it, you just need to do

`docker run monitz87/graphprotocol-schema-generator:latest "$(<PATH_TO_SCHEMA_FILE)"` and it will print the full schema to stdout
