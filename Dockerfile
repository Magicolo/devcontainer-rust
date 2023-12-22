FROM rust

RUN apt update
RUN apt upgrade --yes
RUN apt install --yes git curl pkg-config libssl-dev
RUN rustup install stable 
RUN rustup default stable
RUN rustup component add rustfmt clippy
RUN cargo install cargo-expand
RUN cargo install cargo-audit
RUN cargo install cargo-msrv
ENTRYPOINT rustup update && cargo clean && cargo update && cargo build && sleep infinity