FROM lambci/lambda:build-provided
ARG RUST_VERSION
RUN yum install -y jq php gcc openssl openssl-devel pkg-config libpq postgresql-devel
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
 | sh -s -- -y --profile minimal
RUN rustup override set nightly
RUN rustup update
VOLUME ["/code"]
WORKDIR /code
ENTRYPOINT ["cargo build --release"]
