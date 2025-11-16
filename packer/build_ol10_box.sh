#!/usr/bin/env bash
set -euo pipefail

echo "Running Packer..."
cd templates
packer build -force ol10.pkr.hcl

echo "Adding vagrant box..."
vagrant box add --force ../build/ol10-x86_64-virtualbox.box --name oraclelinux/10-custom
