function chgems()
{
	case "$1" in
		-h|--help)
			echo "usage: chgems [GEM_HOME [COMMAND]]"
			return
			;;
	esac

	local root=$1
	local command=$2

	[[ -z "$root" ]]    && root="$PWD"
	[[ -z "$command" ]] && command="$SHELL"

	local ruby_engine
	local ruby_version
	local gem_root

	eval `ruby - <<EOF
require 'rubygems'
puts "ruby_engine=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
puts "ruby_version=#{RUBY_VERSION}"
puts "gem_root=\"#{Gem.default_dir}\""
EOF`

	local gem_home="$root/.gem/$ruby_engine/$ruby_version"

	env PATH="$gem_home/bin:$PATH" \
	    GEM_HOME="$gem_home" \
	    GEM_PATH="$gem_home:$gem_root" \
	    PS1="[$(basename $root)] $PS1" \
	    $command
}
