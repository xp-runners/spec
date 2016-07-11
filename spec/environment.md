# Environment

### Setup

```sh
echo '<?= "XP_", $argv[1], " = ", getenv("XP_".$argv[1]), PHP_EOL; ?>' > "$DIR/class-main.php"
```

## Runner information
Information about the runners is passed in environment variables [as per this definition](https://github.com/xp-runners/reference/pull/51)

```sh
$ xp EXE
XP_EXE = .*

$ xp VERSION
XP_VERSION = .*

$ xp COMMAND
XP_COMMAND = run

$ xp MODEL
XP_MODEL = default
```

