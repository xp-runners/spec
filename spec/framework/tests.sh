#!/bin/sh

script() {
  target="$1"
  script="$2"
  code="$3"

  [ "$code" = '' ] || printf '%s\necho\n' "$code" > "$target/$(echo "$script"  | tr ' ' _ ).sh"
}

parse() {
  file="$1"
  target="$2"

  tests=
  section=
  script=
  while read line ; do
    case "$line" in
      \#\#\#*Teardown*) section=.teardown ;;
      \#\#\#*Setup*) section=.setup ;;
      \#\#*) section="${line#\#\# }" ;;
      \#*) tests="${line#\# }" ;;

      \`\`\`sh)
        case "$section" in
          .*) script="# $section" ;;
          *) script="echo '> '$section" ;;
        esac
        continue
        ;;

      \`\`\`)
        script "$target" "$section" "$script"
        script=
        ;;

      \$*)
        if [ "$script" != '' ] ; then 
          read outcome
          case "$outcome" in
            [0-9]:*) code=${outcome%%:*} ; expected="${outcome#*: }" ;;
            *) code=0 ; expected="$outcome" ;;
          esac
          script=$(printf '%s\nverify "%s" "%s" %d || result=1\n' "$script" "$expected" "$EXE${line#\$ xp}" $code)
          continue 
        fi
        ;;
    esac
    [ "$script" = '' ] && continue

    script=$(printf '%s\n%s' "$script" "$line")
  done < "$markdown"
  script "$target" "$section" "$script"

  echo "$tests"
}