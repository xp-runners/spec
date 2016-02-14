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

## XP
The framework version can be displayed. It is rendered as `XP/X.Y.Z` using xp::version().
*Supported as of XP 7.1.0*

```sh
$ xp version xp
xp.runtime.Version xp
```

## PHP
The PHP version can be displayed. It is rendered as `PHP/X.Y.Z` using phpversion().
*Supported as of XP 7.1.0*

```sh
$ xp version php
xp.runtime.Version php
```

## Engine
The engine version can be displayed. On HHVM, this renders `HHVM/X.Y.Z` (and the version number corresponds to HHVM_VERSION), on regular PHP it displays `Zend/X.Y.Z` using zend_version().
*Supported as of XP 7.1.0*

```sh
$ xp version php
xp.runtime.Version php
```

## Operating system
The OS type and version can be displayed. On Linux systems where `lsb_release` is available, it displays `Linux/[Distribution] [Release] [CodeName]`, otherwise the type and whatever `php_uname('v')` yields.
*Supported as of XP 7.1.0*

```sh
$ xp version os
xp.runtime.Version os
```