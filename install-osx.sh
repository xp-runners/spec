#!/bin/sh

set -e
set -u

MONO_VERSION=4.2.2  # See http://download.mono-project.com/archive/
PHP_VERSION=php70   # See https://github.com/Homebrew/homebrew-php

echo "Installing Mono ${MONO_VERSION}"
curl "http://download.mono-project.com/archive/${MONO_VERSION}/macos-10-x86/MonoFramework-MDK-${MONO_VERSION}.macos10.xamarin.x86.pkg" -o mono.pkg
sudo installer -pkg mono.pkg -target /

echo "Installing ${PHP_VERSION} via Homebrew"
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install ${PHP_VERSION}