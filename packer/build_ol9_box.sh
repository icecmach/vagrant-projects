#!/usr/bin/env bash
set -euo pipefail

echo "Running Packer..."
cd templates
packer build -force ol9.pkr.hcl

echo "Adding vagrant box..."
vagrant box add --force ../build/ol9-x86_64-virtualbox.box --name oraclelinux/9-custom
