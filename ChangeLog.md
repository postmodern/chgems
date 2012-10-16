### 0.2.0 / 2012-10-15

* Install `chgems.sh` into `$PREFIX/share/chgems/`.

### 0.1.4 / 2012-10-14

* Preserve the current `$GEM_PATH` by calling `Gem.path`.

### 0.1.3 / 2012-10-07

* Added unit-tests using [shunit2](https://code.google.com/p/shunit2/).
* Added support for [zsh].
* Print errors to STDERR.
* Correctly pass environment variables to the sub-shell / command.
* Run commands in a sub-shell, otherwise exec a fresh `$SHELL`.
* Ensure the return value of the sub-shell / command is returned.

### 0.1.2 / 2012-10-05

* Check if the directory passed to `chgems` exists.
* Expand relative paths passed to `chgems` to absolute paths.
* Use `eval` instead of `env` to execute the command or sub-shell.
* `cd` into the directory before executing the command, then `cd` out.

### 0.1.1 / 2012-10-04

* Include `Gem.user_dir` and `Gem.default_dir` into `$GEM_PATH.

### 0.1.0 / 2012-10-04

* Initial release.

[zsh]: http://www.zsh.org/
