#!/bin/sh

set -e
set -u

if [ $# -eq 0 ] ; then
  echo "Usage: $0 <spec1>.md [<spec2>.md [...]]"
  exit 1
fi

printf "\033[32;1mXP Runners specification tests\033[0m\n"
echo '(c) 2016 https://github.com/xp-runners/spec/'
uname -a
echo

. $(dirname "$0")/tests.sh
. $(dirname "$0")/verify.sh

temp=${TMPDIR-${TEMP-${TMP-/tmp}}}
result=0
for markdown in "$@" ; do
  DIR=$(mktemp -d "$temp/tmp.XXXXXXXXXX")
  case $(uname) in
    CYGWIN*) EXE=xp.exe ; cp xp.exe "$DIR" ;;
    Darwin*) EXE=xp ; cp xp xp.exe "$DIR" ;;
    *) EXE=xp ; cp xp "$DIR" ;;
  esac

  printf '\033[32;1m%s\033[0m\n' "$(parse "$markdown" "$DIR")"

  [ -f "$DIR/.setup.sh" ] && . "$DIR/.setup.sh"
  for test in "$DIR/"*.sh ; do
    . $test 
  done
  [ -f "$DIR/.teardown.sh" ] && . "$DIR/.teardown.sh"

  rm -rf "$DIR"
done

echo "Exit $result"
exit $result
