FROM rust:1.73-alpine

COPY build.sh mimalloc.diff /tmp/

RUN /tmp/build.sh

ENV LD_PRELOAD=/usr/lib/libmimalloc.so
