# chgems

**DEPRECATED:** chgems has been deprecated in favor of [gem_home].

`chroot` for RubyGems.

## Features

* Sets `$GEM_HOME` to `$project/.gem/$ruby/$version`, isolating installed
  gems to the project directory.
* Updates `$PATH` and `$GEM_PATH`, providing access to both project gems and
  user / system installed gems.
  * Makes `bundle exec` obsolete.
* Runs a sub-shell or another command.
* Plays nicely with [chruby], [rbenv] and [rbfu].
* Supports [bash] and [zsh].
* Small (~50 LOC).
* Has tests.

## Install

    wget -O chgems-0.3.2.tar.gz https://github.com/postmodern/chgems/archive/v0.3.2.tar.gz
    tar -xzvf chgems-0.3.2.tar.gz
    cd chgems-0.3.2/
    sudo make install

### PGP

All releases are [PGP] signed for security. Instructions on how to import my
PGP key can be found on my [blog][1]. To verify that a release was not tampered 
with:

    wget https://raw.github.com/postmodern/chgems/master/pkg/chgems-0.3.2.tar.gz.asc
    gpg --verify chgems-0.3.2.tar.gz.asc chgems-0.3.2.tar.gz

### Homebrew

chgems can also be installed with [homebrew]:

    brew install https://raw.github.com/postmodern/chgems/master/homebrew/chgems.rb

## Examples

`chgems` into a project:

    $ cd ~/project
    $ chgems
    Entering /home/hal/project with gems in .gem/ruby/1.9.3/ ...
    $ gem env
    RubyGems Environment:
      - RUBYGEMS VERSION: 1.8.24
      - RUBY VERSION: 1.9.3 (2012-04-20 patchlevel 194) [x86_64-linux]
      - INSTALLATION DIRECTORY: /home/hal/project/.gem/ruby/1.9.3
      - RUBY EXECUTABLE: /usr/bin/ruby
      - EXECUTABLE DIRECTORY: /home/hal/project/.gem/ruby/1.9.3/bin
      - RUBYGEMS PLATFORMS:
        - ruby
        - x86_64-linux
      - GEM PATHS:
         - /home/hal/project/.gem/ruby/1.9.3
         - /home/hal/.gem/ruby/1.9.1
         - /usr/share/gems
         - /usr/local/share/gems
      - GEM CONFIGURATION:
         - :update_sources => true
         - :verbose => true
         - :benchmark => false
         - :backtrace => false
         - :bulk_threshold => 1000
         - "gem" => "--no-rdoc"
      - REMOTE SOURCES:
         - http://rubygems.org/

`chgems` into a directory:

    $ chgems ~/project

`chgems` into a directory, run a command and return:

    $ chgems ~/project rspec

Cleaning up a `chgems` project:

    $ rm -rf project

## Caveat

If you load a Ruby switcher/manager in `~/.bashrc` or `~/.zshrc` and a
`.ruby-version` file is present, it will override the `$GEM_HOME` and
`$GEM_PATH` set by chgems. The workaround to this conflict is to simply load
the Ruby switcher/manager in `~/.bash_profile` or `~/.zprofile`.

## Alternatives

* [gs](https://github.com/inkel/gs#readme)
* [gst](https://github.com/tonchis/gst#readme)
* [ohmygems](http://blog.zenspider.com/blog/2012/09/ohmygems.html)
* [renv](https://github.com/fnichol/renv)

## Credits

* [mpapis](https://github.com/mpapis) for reviewing the code.

[gem_home]: https://github.com/postmodern/gem_home#readme
[rbenv]: https://github.com/sstephenson/rbenv#readme
[rbfu]: https://github.com/hmans/rbfu#readme
[chruby]: https://github.com/postmodern/chruby#readme

[bash]: http://www.gnu.org/software/bash/
[zsh]: http://www.zsh.org/
[PGP]: http://en.wikipedia.org/wiki/Pretty_Good_Privacy
[homebrew]: http://mxcl.github.com/homebrew/

[1]: http://postmodern.github.com/contact.html#pgp
