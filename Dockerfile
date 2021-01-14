FROM python:3-alpine

## Labels
LABEL maintainer="oliverbaehler@hotmail.com, kk@sudo-i.net"

## Environment Variables

### Tavern Configuration
ENV DEBUG false
ENV LOG_TO_FILE ""
ENV TEST_DIRECTORY "/tavern/"
ENV SCRIPT_DIRECTORY "/scripts"

### Paths
ENV PATH "~/.local/bin:${PATH}"

### Base Configuration
ENV TAVERN_VERSION "1.12.2"
ENV TAVERN_USER_ID 1500
ENV TAVERN_GROUP_ID 1500

## Create Tavern User
RUN addgroup -g "${TAVERN_GROUP_ID}" tavern && adduser -s /bin/false -u ${TAVERN_USER_ID} -D -G tavern tavern \
  && apk add --no-cache bash \
  && mkdir -p ${TEST_DIRECTORY} ${SCRIPT_DIRECTORY} \
  && chown -R tavern:tavern ${TEST_DIRECTORY} ${SCRIPT_DIRECTORY}

## Install Tavern
USER tavern
RUN pip install --force-reinstall --user tavern==${TAVERN_VERSION} 

## Copy Entrypoint
COPY ./entrypoint.sh /

## Working Directory
WORKDIR "${TEST_DIRECTORY}"

VOLUME ["/tavern"]
## EntryPoint
ENTRYPOINT ["/entrypoint.sh"]
