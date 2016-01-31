# Working with XAR files

### Setup

```sh
echo '<?= implode(" ", array_slice($argv, 1)); ?>' > "$DIR/class-main.php"
```

## Archiving
Archives are handled by the xar runner

```sh
$ xp ar
xp.xar.Runner

$ xp ar cvf test.xar .
xp.xar.Runner cvf test.xar .
```