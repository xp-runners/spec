# The "help" subcommand

### Setup

```sh
echo '<?= implode(" ", array_slice($argv, 1)); ?>' > "$DIR/class-main.php"
```

## Global help
Shows a **TL;DR** style help message about the "xp" command.

```sh
$ xp
xp.runtime.Help +AEA-xp/runtime/xp.md

$ xp -?
xp.runtime.Help +AEA-xp/runtime/xp.md

$ xp help
xp.runtime.Help +AEA-xp/runtime/xp.md
```

## Further help topics
Global help topics can be addressed by prefixing a `/`.

```sh
$ xp help /topic
xp.runtime.Help +AEA-xp/runtime/topic.md
```

## Subcommand help
Help about builtin subcommands comes *xp/runtime/${command}.md*

```sh
$ xp help ar
xp.runtime.Help +AEA-xp/runtime/ar.md

$ xp help ar/versions
xp.runtime.Help +AEA-xp/runtime/ar/versions.md
```
