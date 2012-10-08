function chgems()
{
	case "$1" in
		-h|--help)
			echo "usage: chgems [GEM_HOME [COMMAND]]"
			return
			;;
	esac

	local root=$1 && shift
	local command=$@

	if [[ -n "$root" ]]; then root=$(readlink -f $root)
	else			  root="$PWD"
	fi

	if [[ ! -d "$root" ]]; then
		echo "chgems: cannot use $root as a gem dir: No such directory" >&2
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

	(
		cd "$root"
		export PATH="$gem_dir/bin:$PATH"
		export GEM_HOME="$gem_dir"
		export GEM_PATH="$gem_dir:$gem_home:$gem_root"
		export PS1="$(basename "$root")> $PS1"

		if [[ ${#command[@]} -gt 0 ]]; then eval $command
		else                                exec $SHELL
		fi
	)
}
