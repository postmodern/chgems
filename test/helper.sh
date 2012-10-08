#!/bin/sh

eval `ruby - <<EOF
require 'rubygems'
puts "TEST_RUBY_ENGINE=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
puts "TEST_RUBY_VERSION=#{RUBY_VERSION}"
puts "TEST_GEM_ROOT=\"#{Gem.default_dir}\""
puts "TEST_GEM_HOME=\"#{Gem.user_dir}\""
EOF`

TEST_DIR="$PWD/test"
TEST_NAME=$(basename $TEST_DIR)
TEST_GEM_DIR="$TEST_DIR/.gem/$TEST_RUBY_ENGINE/$TEST_RUBY_VERSION"

PS1="test$"

. ./etc/profile.d/chgems.sh
