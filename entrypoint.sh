#!/bin/ash

test -d "$INPUT_SOURCE" -o \
     -f "$INPUT_SOURCE" || \
     echo "'$INPUT_SOURCE' does not exist inside your repository" && \
     exit 255

test -z "$INPUT_AWS_ACCESS_KEY" -o \
     -z "$INPUT_AWS_SECRET_KEY" -o \
     -z "$INPUT_AWS_REGION" -o \
     -z "$INPUT_AWS_BUCKET" && \
     echo "access_key, secret_key, region or bucket missing or empty" && \
     exit 255

export AWS_ACCESS_KEY_ID="$INPUT_AWS_ACCESS_KEY"
export AWS_SECERET_ACCESS_KEY="$INPUT_AWS_SECRET_KEY"
export AWS_REGION="$INPUT_AWS_REGION"

set -e

if [ "$INPUT_COPY_METHOD" == "copy" ]; then
    aws s3 cp $INPUT_SOURCE s3://$INPUT_AWS_BUCKET/$INPUT_DESTINATION
elif [ "$INPUT_COPY_METHOD" == "sync" ]; then
    if [ "$INPUT_COPY_DELETE" == "true" ]; then
        aws s3 sync --delete $INPUT_SOURCE s3://$INPUT_AWS_BUCKET/$INPUT_DESTINATION
    else
        aws s3 sync $INPUT_SOURCE s3://$INPUT_AWS_BUCKET/$INPUT_DESTINATION
    fi
else
    echo "copy_method has to be 'copy' or 'sync'"
    exit 255
fi