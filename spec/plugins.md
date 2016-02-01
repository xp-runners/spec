# Plugin architecture

### Setup

```sh
echo '<?= implode(" ", array_slice($argv, 1)); ?>' > "$DIR/class-main.php"
PREV="$(pwd)"
cd "$DIR"
```

### Teardown

```sh
cd "$PREV"
```

## User
A user subcommand can be created by supplying a file named *xp.{vendor}.{name}[.{cmd}]*.

```sh
mkdir bin

touch bin/xp.example.user
$ xp user
xp.user.Runner 

touch bin/xp.example.user.sql
$ xp sql
xp.user.SqlRunner 
```