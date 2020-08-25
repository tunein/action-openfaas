ARG BUILDX_VERSION=19.03.5_0.3.1
FROM jonoh/docker-buildx-qemu:${BUILDX_VERSION}

RUN apt-get update && apt-get install -y \
        python \
        python-pip && \
    pip install --upgrade awscli==1.18.125

ARG FAAS_CLI_VERSION=0.12.8
RUN curl -sLSf -o faas-cli https://github.com/openfaas/faas-cli/releases/download/${FAAS_CLI_VERSION}/faas-cli

RUN mv faas-cli /usr/local/bin/ && \
    chmod +x /usr/local/bin/faas-cli

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
