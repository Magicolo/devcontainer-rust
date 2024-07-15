FROM rust

RUN apt update
RUN apt upgrade --yes
RUN apt install --yes git git-lfs curl build-essential pkg-config libssl-dev lldb google-perftools
RUN rustup install stable nightly
RUN rustup default stable
RUN rustup component add rustfmt clippy
RUN rustup update
RUN curl --silent https://raw.githubusercontent.com/nektos/act/master/install.sh | bash
RUN cargo install cargo-expand cargo-audit cargo-msrv
RUN chmod -R a+rwx /usr/local/rustup /usr/local/cargo
CMD sleep infinity