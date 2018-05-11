#!/bin/bash -v

# https://docs.aws.amazon.com/cli/latest/reference/iam/change-password.html
aws iam change-password --generate-cli-skeleton > change-password.json
# aws iam change-password --cli-input-json file://change-password.json

exit 0
