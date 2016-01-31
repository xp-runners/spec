XP Runners
==========
[![Build Status on TravisCI](https://secure.travis-ci.org/xp-runners/spec.svg)](http://travis-ci.org/xp-runners/spec)
[![BSD License](https://raw.githubusercontent.com/xp-framework/web/master/static/licence-bsd.png)](https://github.com/xp-runners/reference/blob/master/LICENSE.md)

Test the XP Runners specification. Uses a markdown-driven specification (*see below*).

## Running the tests

```
$ sh spec/framework/run.sh spec/*.md
XP Runners specification tests
(c) 2016 https://github.com/xp-runners/spec/
Linux vagrant-ubuntu-vivid-64 3.19.0-42-generic #48-Ubuntu SMP Thu Dec 17 22:54:45 UTC 2015 x86_64 GNU/Linux

Basic tests

> Negative tests
✓ OK: `xp nih' -> Command not implemented: nih

> Run
✓ OK: `xp com.example.Test' -> com.example.Test
✓ OK: `xp com/example/Test.class.php' -> com/example/Test.class.php
✓ OK: `xp run com.example.Test' -> com.example.Test
✓ OK: `xp run com.example.Test Arg1 Arg2' -> com.example.Test Arg1 Arg2

# ...

Exit 0
```

## Authoring a test

The parser works as follows:

* The first-level headline in a file becomes the category's name (e.g., *Basic tests* in the output above)
* Second-level headlines become group names (e.g., *Negative tests*)
* Code inside a code block with `sh` language is executed.
* If a code line starts with `$`, the command following it is executed. Its output is compared against the following line.
* Code from inside third-level headlines titled *Setup* and *Teardown* are executed before and after a category is run, respectively
* Tests error when their code yields a nonzero exitcode.

Have a look at the markdown files [in here](https://github.com/xp-runners/spec/tree/master/spec) for examples.