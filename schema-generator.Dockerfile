# Full build with debuginfo for schema-generator
#
# The expectation if that the docker build uses the parent directory as PWD
# by running something like the following
#   docker build --target STAGE -f docker/Dockerfile .
FROM rust:bullseye as schema-generator-builder

WORKDIR /schema-generator
ADD . ./

RUN apt-get update && apt-get install -y cmake protobuf-compiler
RUN RUSTFLAGS="-g" cargo build --release --package graph-graphql
RUN cp target/release/schema-generator /usr/local/bin/schema-generator
RUN cargo clean
RUN objcopy --only-keep-debug /usr/local/bin/schema-generator /usr/local/bin/schema-generator.debug
RUN strip -g /usr/local/bin/schema-generator
RUN cd /usr/local/bin && objcopy --add-gnu-debuglink=schema-generator.debug schema-generator

# The schema-generator runtime image with only the executable
FROM debian:bullseye-slim as schema-generator
ENV RUST_LOG ""

RUN apt-get update && apt-get install -y libpq-dev

COPY --from=schema-generator-builder /usr/local/bin/schema-generator /usr/local/bin/schema-generator

ENTRYPOINT ["schema-generator"]
