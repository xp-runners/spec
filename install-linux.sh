#!/bin/sh

set -e
set -u

echo "Installing Mono"
sudo apt-get update
sudo apt-get install -y libmono-corlib4.5-cil libmono-2.0-1

echo "Installing PHP"
sudo apt-get install php5-cli