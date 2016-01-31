#!/bin/sh

set -e
set -u

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

printf "\033[32;1mXP Runners tests\033[0m\n"
echo '(c) 2016 https://github.com/xp-runners/spec/'
uname -a
echo

case $(uname) in
  CYGWIN*) EXE=xp.exe ;;
  *) EXE=xp ;;
esac

DIR=$(mktemp -d)
cp xp* "$DIR"
echo '<?= implode(" ", array_slice($argv, 1));' > "$DIR/class-main.php"
result=0

echo "Run"
verify "com.example.Test" "$EXE com.example.Test" || result=1
verify "com.example.Test" "$EXE run com.example.Test" || result=1
verify "com.example.Test Arg1 Arg2" "$EXE run com.example.Test Arg1 Arg2" || result=1
echo

echo "Help"
verify "xp.runtime.Help +AEA-xp/runtime/xp.md" "$EXE" || result=1
verify "xp.runtime.Help +AEA-xp/runtime/xp.md" "$EXE -?" || result=1
verify "xp.runtime.Help +AEA-xp/runtime/xp.md" "$EXE help" || result=1
verify "xp.runtime.Help +AEA-xp/runtime/ar.md" "$EXE help ar" || result=1
verify "xp.runtime.Help +AEA-xp/runtime/topic.md" "$EXE help /topic" || result=1
#-IGNORE verify "xp.runtime.Help +AEA-xp/runtime/topic.md" "$EXE help ar/topic" || result=1
echo

echo "Version"
verify "xp.runtime.Version" "$EXE -v" || result=1
verify "xp.runtime.Version" "$EXE version" || result=1
echo

echo "Dump"
verify "xp.runtime.Dump -w" "$EXE -w" || result=1
verify "xp.runtime.Dump -d" "$EXE -d" || result=1
verify "xp.runtime.Dump -w" "$EXE write" || result=1
verify "xp.runtime.Dump -d" "$EXE dump" || result=1
echo

echo "Eval"
verify "xp.runtime.Evaluate" "$EXE -e" || result=1
verify "xp.runtime.Evaluate" "$EXE eval" || result=1
echo

echo "XAR"
verify "xp.xar.Runner" "$EXE ar" || result=1
verify "xp.xar.Runner cvf test.xar ." "$EXE ar cvf test.xar ." || result=1
echo

echo "Negative tests"
verify "Command not implemented: nih" "$EXE nih" 2 || result=1

rm -rf "$DIR"
echo
echo "Exit $result"
exit $result
