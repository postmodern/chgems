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

	if [[ -n "$root" ]]; then root=$(readlink -f $root)
	else			  root="$PWD"
	fi

	[[ -z "$command" ]] && command="$SHELL"

	if [[ ! -d "$root" ]]; then
		echo "chgems: cannot use $root as a gem dir: No such directory"
		return 1
	fi

	local ruby_engine
	local ruby_version
	local gem_root
	local gem_home

	eval `ruby - <<EOF
require 'rubygems'
puts "ruby_engine=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
puts "ruby_version=#{RUBY_VERSION}"
puts "gem_root=\"#{Gem.default_dir}\""
puts "gem_home=\"#{Gem.user_dir}\""
EOF`

	local gem_dir="$root/.gem/$ruby_engine/$ruby_version"

	cd $root/
	eval 'PATH="$gem_dir/bin:$PATH"' \
	     'GEM_HOME="$gem_dir"' \
	     'GEM_PATH="$gem_dir:$gem_home:$gem_root"' \
	     'PS1="$(basename $root)> $PS1"' \
	     $command
	cd $OLDPWD
}
