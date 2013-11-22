# chgems 1 "Nov 2013" chgems "User Manuals"

## SYNOPSIS

`chgems` [ROOT [COMMAND [ARGS]...]]

## DESCRIPTION

chroot for RubyGems.

https://github.com/postmodern/chgems#readme

## ARGUMENTS

*ROOT*
	chgems into this directory.

## OPTIONS

`-V`, `--version`
	Prints the current chgems version.

`-h`, `--help`
	Prints a synopsis of chgems usage.

## EXAMPLES

chgems into a project:

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

chgems into a directory:

        $ chgems ~/project

chgems into a directory, run a command and return:

        $ chgems ~/project rspec

## ENVIRONMENT

*GEM_HOME*
	Default repository location for gem installation. Set to isolate installed gems to the project directory.
    
*GEM_PATH*
	A colon-separated list of gem repository directories.

*PATH*
	Updates the PATH environment variable providing access to both project gems and user / system installed gems.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

ruby(1), gem(1), ruby-install(1), chruby(1), chruby-exec(1)
