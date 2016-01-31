#!/bin/sh

tests() {
  category="$1"

  printf "\033[32;1mXP Runners $category tests\033[0m\n"
  echo '(c) 2016 https://github.com/xp-runners/spec/'
  uname -a
  echo

  case $(uname) in
    CYGWIN*) EXE=xp.exe ;;
    *) EXE=xp ;;
  esac

  return 0
}