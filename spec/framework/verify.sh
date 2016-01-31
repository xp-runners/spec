#!/bin/sh

verify() {
  expect="$1"
  command="$2"
  code=${3-0}

  before=$(pwd)
  output=$("$DIR"/$command 2>&1) && exit=0 || exit=$?

  if [ $exit -eq $code ] ; then
    if echo "$output" | grep -q "$expect"; then
      echo "✓ OK: \`$command' -> $output"
      return 0
    else
      printf "\033[33;1m× FAIL: \`$command' -> Expect $expect, have $output\033[0m\n"
      return 1
    fi
  else
    printf "\033[31;1m! ERROR: \`$command' $exit: $output\033[0m\n"
    return 127
  fi
}
