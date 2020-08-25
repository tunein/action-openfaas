#!/bin/bash

set -e

# $1 stack-file
# $2 OpenFaaS user
# $3 OpenFaaS password

AUTH_TOKEN=$(aws ecr get-login --no-include-email --region $AWS_DEFAULT_REGION)
echo "🌎authorization to ECR ..."
LOGIN_MESSAGE=$(eval $AUTH_TOKEN)

echo $LOGIN_MESSAGE

if [[ $LOGIN_MESSAGE != "Login Succeeded" ]]; then
    exit 1
fi

echo "🌎authorization to OpenFaaS ..."
echo $3 | faas-cli login --username $2 --password-stdin

echo "🌎Deploying OpenFaaS function ..."
faas-cli up -f $1
