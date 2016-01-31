#!/bin/sh

set -e
set -u

echo "Installing Mono"
sudo apt-get install libmono-corlib4.5-cil libmono-2.0-1

echo "Installing PHP"
sudo apt-get install php5-cli