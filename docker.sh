#!/bin/sh
VERT="\\033[1;32m"
NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"
ROSE="\\033[1;35m"
BLEU="\\033[1;34m"
BLANC="\\033[0;02m"
BLANCLAIR="\\033[1;08m"
JAUNE="\\033[1;33m"
CYAN="\\033[1;36m"

BEHAVIOR="start"
if [[ ! -z "${1}" ]]; then
    BEHAVIOR="${1}"
fi

DOCKER="virtualmachine"
if [[ ! -z "${2}" ]]; then
    DOCKER="${2}"
fi

echo "$BLEU"'Starting '"${DOCKER}"' environment...' "$NORMAL"
cd ~/"${DOCKER}"
echo "$CYAN"'---- docker-machine '"${BEHAVIOR}"' '"${DOCKER}"' ----'"$NORMAL"
docker-machine "${BEHAVIOR}" "${DOCKER}"
echo "$CYAN"'---- docker-machine env '"${DOCKER}"' ----'"$NORMAL"
docker-machine env "${DOCKER}"
echo "$CYAN"'---- eval "$(docker-machine env '"${DOCKER}"')" ----'"$NORMAL"
eval "$(docker-machine env "${DOCKER}")"
echo "$CYAN"'---- docker-compose '"${BEHAVIOR}"' ----'"$NORMAL"
docker-compose "${BEHAVIOR}"
echo "$VERT""${DOCKER}" 'environment is started.'