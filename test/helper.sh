#!/bin/sh

[[ -z "$SHUNIT2"     ]] && SHUNIT2=/usr/share/shunit2/shunit2
[[ -n "$ZSH_VERSION" ]] && setopt shwordsplit

eval `ruby - <<EOF
require 'rubygems'
puts "TEST_RUBY_ENGINE=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
puts "TEST_RUBY_VERSION=#{RUBY_VERSION}"
puts "TEST_GEM_PATH=\"#{Gem.path.join(':')}\""
EOF`

TEST_DIR="$PWD/test"
TEST_NAME=$(basename $TEST_DIR)
TEST_GEM_DIR="$TEST_DIR/.gem/$TEST_RUBY_ENGINE/$TEST_RUBY_VERSION"

PATH="$PWD/bin:$PATH"

setUp() { return; }
tearDown() { return; }
oneTimeTearDown() { return; }
