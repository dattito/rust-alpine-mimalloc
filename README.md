# `rust-alpine-mimalloc`

This Docker image builds upon the `alpine:latest` image, provides
`cargo`/`rustc` and replaces the default musl malloc implementation
with [`mimalloc`](https://github.com/microsoft/mimalloc). If you build
Rust or C/C++ static executables in this image, the resulting
executables will automatically link with `mimalloc` without needing
any special build flags.

Notice: we switched away from `rust:alpine` and now uses
`cargo`/`rust` packaged by alpine. Statically linked executables will
continue to link against `mimalloc` as intended, but you need extra
command-line arguments to ensure they are indeed static:

```sh
$ RUSTFLAGS="-C target-feature=+crt-static" cargo install --target x86_64-alpine-linux-musl foo
```

The `--target` flag is required. The default target is either
`x86_64-alpine-linux-musl` or `aarch64-alpine-linux-musl`, and can
also be extracted from `$(rustc -vV | sed -n "s|host: ||p")`.

Supported & tested archs: `amd64` and `arm64/v8`.

For more details, see this [blog
post](https://www.tweag.io/blog/2023-08-10-rust-static-link-with-mimalloc).

## Template

For my projects, most of the times I use a Dockerfile that looks like the on defined in `Dockerfile.template`.
Just change the `RUST_VERSION` and `BINARY_NAME` argument and you should get the smallest image possible :).
