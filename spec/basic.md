# Basic tests

### Setup

```sh
echo '<?= implode(" ", array_slice($argv, 1)); ?>' > "$DIR/class-main.php"
```

## Run
Run is the default subcommand.

```sh
$ xp com.example.Test
com.example.Test

$ xp com/example/Test.class.php
com/example/Test.class.php

$ xp run com.example.Test
com.example.Test

$ xp run com.example.Test Arg1 Arg2
com.example.Test Arg1 Arg2
```

## Negative tests

```sh
$ xp nih
2: Command not implemented: nih
```