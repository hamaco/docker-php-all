FROM scratch

ADD images.tar.gz /

ENTRYPOINT ["/root/bin/php"]
CMD ["-v"]
