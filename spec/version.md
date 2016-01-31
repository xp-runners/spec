# The "version" subcommand

### Setup

```sh
echo '<?= implode(" ", array_slice($argv, 1)); ?>' > "$DIR/class-main.php"
```

## Version
To display framework and runtime version as well as classloader information, use one of the following:

```sh
$ xp -v
xp.runtime.Version

$ xp version
xp.runtime.Version
```