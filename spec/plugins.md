# Plugin architecture

### Setup

```sh
echo '<?= implode(" ", array_slice($argv, 1)); ?>' > "$DIR/class-main.php"
PREV="$(pwd)"
cd "$DIR"

mkdir bin
touch bin/xp.example.user
touch bin/xp.example.user.sql
```

### Teardown

```sh
cd "$PREV"
```

## Subcommands
A user subcommand can be created by supplying a file named *xp.{vendor}.{name}[.{cmd}]*.

```sh
$ xp user
xp.user.Runner 

$ xp sql
xp.user.SqlRunner 
```

## Help
The `help` subcommand will use the subcommand's entry point as argument for the Help class.

```sh
$ xp help user
xp.runtime.Help xp.user.Runner

$ xp help sql
xp.runtime.Help xp.user.SqlRunner

$ xp help user/topic
xp.runtime.Help +AEA-xp/user/user/topic.md

$ xp help sql/topic
xp.runtime.Help +AEA-xp/user/sql/topic.md
```