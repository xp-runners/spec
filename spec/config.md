# Configuration

### Setup

```sh
echo "use=core-via-ini" > ./xp.ini
echo '<?= explode(PATH_SEPARATOR.PATH_SEPARATOR, get_include_path())[0] ?>' > "$DIR/class-main.php"
```

## Config file search path
The default is to search for xp.ini in `.`, `$HOME/.xp`, `$LOCALAPPDATA/Xp`, and `dirname($0)`.

```sh
$ xp
core-via-ini
```

## Passing a config file
The configuration file can be explicitely specified via `-c`. If the file does not exist, an error is raised.

```sh
$ xp -c .
core-via-ini

$ xp -c ./xp.ini
core-via-ini

$ xp -c not-an-ini-file
2: Invalid configuration
```

## Without
To run without a configuration file, use `-n`: This only takes environment settings into account.

```sh
export XP_RT=php
export USE_XP=local-core
$ xp -n
local-core
```

*For implementation details, see [PR #42](https://github.com/xp-runners/reference/pull/42).*

### Teardown

```sh
rm ./xp.ini
```
