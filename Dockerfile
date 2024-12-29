FROM alpine:latest

ARG TARGETARCH

COPY build.sh mimalloc.diff set_target.sh /tmp/

RUN /tmp/set_target.sh  "$TARGETARCH"

RUN /tmp/build.sh

ENV LD_PRELOAD=/usr/lib/libmimalloc.so
