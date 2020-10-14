#!/usr/bin/env sh

docker pull ezhevikina/x-training-ezhevikina
docker run --rm -it -p 8000:80 ezhevikina/x-training-ezhevikina sh