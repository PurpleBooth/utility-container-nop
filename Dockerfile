FROM rust:1.73.0 as builder

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Cargo.toml Cargo.lock ./
COPY src/main.rs ./src/main.rs
RUN RUSTFLAGS='-C target-feature=+crt-static' cargo build --release

FROM scratch

COPY --from=builder /usr/src/app/target/release/nop /nop
ENTRYPOINT ["/nop"]