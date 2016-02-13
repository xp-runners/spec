#!/bin/sh

set -e
set -u

echo "Installing Mono"
sudo apt-get update
sudo apt-get install -y libmono-corlib4.5-cil libmono-system-core4.0-cil

echo "Installing PHP"
sudo apt-get install -y php5-cli