FROM ubuntu@sha256:99c35190e22d294cdace2783ac55effc69d32896daaa265f0bbedbcde4fbe3e5 AS builder
ARG TARGETPLATFORM

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y \
      build-essential \
      bash \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/usr/bin/env", "bash", "-c"]
RUN mkdir -p /usr/src/app /usr/src/app/target
WORKDIR /usr/src/app
COPY src/* src/

WORKDIR /usr/src/app/target
RUN case "$TARGETPLATFORM" in "linux/amd64") as ../src/nop_amd64.asm -o nop.o; ;; "linux/arm64") as ../src/nop_arm64.asm -o nop.o; ;; *) exit 99; ;; esac

RUN ld -n --strip-all nop.o -o nop
WORKDIR /usr/src/app
RUN ./target/nop
FROM scratch

COPY --from=builder /usr/src/app/target/nop /nop
USER 1000:1000
ENTRYPOINT ["/nop"]
