FROM alpine:3.7

COPY requirements.pip /tmp/requirements.pip

RUN apk add --no-cache python3 ca-certificates && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install -r /tmp/requirements/pip && \
    rm -r /root/.cache

ENTRYPOINT ["/usr/bin/pyup"]
