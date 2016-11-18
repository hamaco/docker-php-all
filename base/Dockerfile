FROM alpine:3.4

ARG PHP_VERSION

WORKDIR /work

RUN apk add --no-cache --virtual .php-builddeps \
        ca-certificates bash git make gcc patch re2c flex libc-dev
RUN apk add --no-cache libxml2-dev bzip2-dev
RUN git clone https://github.com/hnw/phpall.git

ADD ./scripts/make-image.bash /work/make-image.bash 

ENTRYPOINT ["/work/make-image.bash"]
