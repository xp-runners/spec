XP Runners
==========
[![Build Status on TravisCI](https://secure.travis-ci.org/xp-runners/spec.svg)](http://travis-ci.org/xp-runners/spec)
[![BSD License](https://raw.githubusercontent.com/xp-framework/web/master/static/licence-bsd.png)](https://github.com/xp-runners/reference/blob/master/LICENSE.md)

Test the XP Runners

```
$ sh spec/basic.sh
XP Runners basic tests
(c) 2016 https://github.com/xp-runners/spec/
CYGWIN_NT-10.0 slate 2.1.0(0.287/5/3) 2015-07-14 21:28 x86_64 Cygwin

Run
✓ OK: `xp.exe com.example.Test' -> com.example.Test
✓ OK: `xp.exe run com.example.Test' -> com.example.Test
✓ OK: `xp.exe run com.example.Test Arg1 Arg2' -> com.example.Test Arg1 Arg2

# ...

Exit 0
```
