FROM rust

RUN apt update
RUN apt upgrade --yes
RUN apt install --yes git curl pkg-config libssl-dev
RUN rustup install stable nightly
RUN rustup default stable
RUN rustup component add rustfmt clippy
RUN cargo install cargo-expand cargo-audit cargo-msrv
ENTRYPOINT rustup update && cargo clean && cargo update && cargo build && sleep infinity