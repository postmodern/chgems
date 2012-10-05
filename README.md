# chgems

Like `chroot` for RubyGems.

## Features

* Correctly sets `$PATH`, `$GEM_HOME` and `$GEM_PATH`.
* Runs a sub-shell or another command.
* Modifies the shell prompt, to remind the developer they are in a gems root.

## Install

    wget http://cloud.github.com/downloads/postmodern/chgems/chgems-0.1.0.tar.gz
    tar -xjvf chgems-0.1.0.tar.gz
    cd chgems-0.1.0/
    make install

### PGP

All releases are [PGP] signed for security. Instructions on how to import my
PGP key can be found on my [blog][1]. To verify that a release was not tampered 
with:

    wget http://cloud.github.com/downloads/postmodern/chgem/chgems-0.1.0.tar.gz.asc
    gpg --verify chgems-0.1.0.tar.gz.asc chgems-0.1.0.tar.gz

## Examples

`chgems` into a project:

    $ cd ~/project
    $ chgems
    [project] $ gem env
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
         - /home/halproject/.gem/ruby/1.9.3
         - /home/hal/.gem/ruby/1.9.1
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

## Alternatives

* [gs](https://github.com/inkel/gs#readme)
* [omg](http://blog.zenspider.com/blog/2012/09/ohmygems.html)

[bash]: http://www.gnu.org/software/bash/
[zsh]: http://www.zsh.org/
[PGP]: http://en.wikipedia.org/wiki/Pretty_Good_Privacy

[1]: http://postmodern.github.com/contact.html#pgp
