# Command line evaluation

### Setup

```sh
echo '<?= implode(" ", array_slice($argv, 1)); ?>' > "$DIR/class-main.php"
```

## Eval
Code passed to the *eval* command is evaluated

```sh
$ xp -e
xp.runtime.Evaluate

$ xp eval
xp.runtime.Evaluate
```

## Write
Like evaluation, but write result using `Console::writeLine()`.

```sh
$ xp -w
xp.runtime.Dump -w

$ xp write
xp.runtime.Dump -w

$ xp -w PHP_BINARY
xp.runtime.Dump -w PHP+AF8-BINARY
```

## Dump
Same as writing, but uses `var_dump()`:

```sh
$ xp -d
xp.runtime.Dump -d

$ xp dump
xp.runtime.Dump -d

$ xp -d PHP_BINARY
xp.runtime.Dump -d PHP+AF8-BINARY
```