#!/bin/sh

set -e
set -u

verify() {
  expect="$1"
  command="$2"
  code=${3-0}

  output=$($command 2>&1) && exit=0 || exit=$? 

  if [ $exit -eq $code ] ; then
    if echo "$output" | grep -q "$expect"; then
      echo "✓ OK: \`$command' -> $output"
      return 0
    else
      echo "× FAIL: \`$command' -> Expect $expect, have $output"
      return 1
    fi
  else
    echo "! ERROR: \`$command' $exit: $output"
    return 127
  fi
}

case $(uname) in
  CYGWIN*) EXE=xp.exe ;;
  *) EXE=xp ;;
esac

dir=$(mktemp -d)
cp xp* "$dir"
echo '<?= $argv[1];' > "$dir/class-main.php"
result=0

echo "Run"
verify "com.example.Test" "$dir/$EXE com.example.Test" || result=1
verify "com.example.Test" "$dir/$EXE run com.example.Test" || result=1
echo

echo "Help"
verify "xp.runtime.Help" "$dir/$EXE" || result=1
verify "xp.runtime.Help" "$dir/$EXE -?" || result=1
verify "xp.runtime.Help" "$dir/$EXE help" || result=1
echo

echo "Version"
verify "xp.runtime.Version" "$dir/$EXE -v" || result=1
verify "xp.runtime.Version" "$dir/$EXE version" || result=1
echo

echo "Dump"
verify "xp.runtime.Dump" "$dir/$EXE -w" || result=1
verify "xp.runtime.Dump" "$dir/$EXE -d" || result=1
verify "xp.runtime.Dump" "$dir/$EXE write" || result=1
verify "xp.runtime.Dump" "$dir/$EXE dump" || result=1
echo

echo "Eval"
verify "xp.runtime.Evaluate" "$dir/$EXE -e" || result=1
verify "xp.runtime.Evaluate" "$dir/$EXE eval" || result=1
echo

echo "XAR"
verify "xp.xar.Runner" "$dir/$EXE ar" || result=1
echo

echo "Negative tests"
verify "Command not implemented: nih" "$dir/$EXE nih" 2 || result=1

rm -rf "$dir"
echo
echo "Exit $result"
exit $result
