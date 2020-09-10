FROM docker:19.03.12

RUN apk add curl git

ARG FAAS_CLI_VERSION=0.12.8
RUN curl -sLSf -o faas-cli https://github.com/openfaas/faas-cli/releases/download/${FAAS_CLI_VERSION}/faas-cli

RUN mv faas-cli /usr/local/bin/ && \
    chmod +x /usr/local/bin/faas-cli

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]