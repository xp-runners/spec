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
      printf "\033[33;1m× FAIL: \`%s' -> Expect %s, have %s\033[0m\n" "$command" "$expect" "$output"
      return 1
    fi
  else
    printf "\033[31;1m! ERROR: \`%s' %d: %s\033[0m\n" "$command" $exit "$output"
    return 127
  fi
}
