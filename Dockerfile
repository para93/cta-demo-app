FROM alpine:latest

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN mkdir -p /usr/local/demo-app

ADD . /usr/local/demo-app/
RUN chmod +x /usr/local/demo-app/sourceguard-cli

RUN echo "SourceGuard Demo"
RUN /usr/local/demo-app/sourceguard-cli -src /usr/local/demo-app/ -x test.sh -x "src/**"
