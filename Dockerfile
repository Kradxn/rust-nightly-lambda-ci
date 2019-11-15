FROM lambci/lambda:build-provided
RUN yum install -y jq php gcc openssl openssl-devel pkg-config libpq postgresql-devel
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 
RUN $HOME/.cargo/bin/rustup override set nightly
RUN $HOME/.cargo/bin/rustup update
VOLUME ["/code"]
WORKDIR /code
ENTRYPOINT ["cargo build --release"]
