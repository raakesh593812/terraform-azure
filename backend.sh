#!/bin/bash
set -e
terraform init -backend-config="sas_token='$1'" -force-copy
