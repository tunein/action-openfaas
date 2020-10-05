#!/bin/bash

set -e

# $1 action (build/deploy)
# $2 stack-file
# $3 OpenFaaS user
# $4 OpenFaaS password
# $5 Template repository URL

build() {
  echo "🌎building image of OpenFaaS function ..."
  faas-cli template pull
  faas-cli template pull $2
  BUILDING_MESSAGES_STRING=$(faas-cli build -f $1 | grep 'Image:')
  FULL_IMAGE_ARN=$(echo $BUILDING_MESSAGES_STRING | awk '{print $2}')
  echo "::set-output name=registry::$(echo $FULL_IMAGE_ARN | awk -F'/' '{print $1}')"
  echo "::set-output name=repository::$(echo $FULL_IMAGE_ARN | awk -F'/' '{print $2}' | awk -F':' '{print $1}')"
  echo "::set-output name=tag::$(echo $FULL_IMAGE_ARN | awk -F':' '{print $2}')"
}

deploy() {
  echo "🌎authorization to OpenFaaS ..."
  echo $3 | faas-cli login --username $2 --password-stdin
  echo "🌎deploying function to OpenFaaS ..."
  faas-cli deploy -f $1
}

if [ "$1" == "" ]; then
  >&2 echo "error: incorrect args"
fi

if [ "$1" == "build" ]; then
  build $2 $5
fi

if [ "$1" == "deploy" ]; then
  deploy $2 $3 $4
fi
