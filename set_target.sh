#!/bin/sh

TARGETARCH=$1

echo "Target architecture : ${TARGETARCH}"

mkdir /.cargo

rust_target="unknown"

if [ "${TARGETARCH}" = "amd64" ]; then
  rust_target="x86_64-alpine-linux-musl";
fi

if [ "${TARGETARCH}" = "arm64" ];then 
  rust_target="aarch64-alpine-linux-musl";
fi

if ["${rust_target}" = "unknown"]; then
  echo "Architecture not yet supported / tested. Good luck."
  exit 0
fi

cat <<EOF >> /.cargo/config.toml
[build]
target="${rust_target}"

[target.${rust_target}]
rustflags = ["-C", "target-feature=+crt-static"]
EOF
