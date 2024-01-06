FROM rust

RUN apt update
RUN apt upgrade --yes
RUN apt install --yes git curl pkg-config lldb libssl-dev
RUN rustup install stable nightly
RUN rustup default stable
RUN rustup component add rustfmt clippy
RUN cargo install cargo-expand cargo-audit cargo-msrv
RUN curl --silent https://raw.githubusercontent.com/nektos/act/master/install.sh | bash
RUN chmod -R a+rwx /usr/local/rustup /usr/local/cargo
CMD rustup update && cargo clean && cargo update && cargo build && sleep infinity