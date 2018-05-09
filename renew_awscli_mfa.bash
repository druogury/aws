#!/bin/bash -v

aws-mfa --device arn:aws:iam::556593845588:mfa/damien.russier@ogury.co

exit 0

aws sts get-session-token --serial-number arn:aws:iam::556593845588:user/damien.russier@ogury.co --token-code $1
