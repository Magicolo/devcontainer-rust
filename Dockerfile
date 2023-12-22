FROM rust

RUN apt update
RUN apt upgrade --yes
RUN apt install --yes git git-lfs curl pkg-config libssl-dev
RUN git config --global user.email magicololand@gmail.com
RUN git config --global user.name Magicolo
USER $USER
RUN rustup install stable 
RUN rustup default stable
RUN rustup component add rustfmt clippy
RUN cargo install cargo-expand
RUN cargo install cargo-audit
RUN cargo install cargo-watch
ENTRYPOINT rustup update && cargo clean && cargo update && cargo build && sleep infinity