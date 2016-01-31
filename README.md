XP Runners
==========
[![Build Status on TravisCI](https://secure.travis-ci.org/xp-runners/spec.svg)](http://travis-ci.org/xp-runners/spec)
[![BSD License](https://raw.githubusercontent.com/xp-framework/web/master/static/licence-bsd.png)](https://github.com/xp-runners/reference/blob/master/LICENSE.md)

Test the XP Runners

```
$ sh spec/framework/run.sh spec/*.md
XP Runners specification tests
(c) 2016 https://github.com/xp-runners/spec/
Linux vagrant-ubuntu-vivid-64 3.19.0-42-generic #48-Ubuntu SMP Thu Dec 17 22:54:45 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux

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
