#!/bin/sh

TARGETARCH=$1

echo "Target architecture : ${TARGETARCH}"

mkdir /.cargo

rust_target="unknown"

if [ "${TARGETARCH}" = "amd64" ]; then
  rust_target="x86_64-unknown-linux-musl";
fi

if [ "${TARGETARCH}" = "arm64" ];then 
  rust_target="aarch64-unknown-linux-musl";
fi

if ["${rust_target}" = "unknown"]; then
  exit 0
fi

cat <<EOF >> /.cargo/config.toml
[build]
target="${rust_target}"
EOF
