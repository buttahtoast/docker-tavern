#!/bin/bash
set -e

## Execute Command, Defaults to Tavern
if [[ -n "$@" ]]; then
  exec "$@"
else
  ## Assemble Tavern Command
  CMD="tavern-ci"
  if [ "${DEBUG,,}" == "true" ]; then
    CMD="${CMD} --debug"
  fi
  if [[ -n "${LOG_TO_FILE}" ]]; then
    CMD="${CMD} --log-to-file ${LOG_TO_FILE}"
  else
    CMD="${CMD} --stdout"
  fi
  CMD="${CMD} ${TEST_DIRECTORY%/}/*"
  exec $CMD
fi
