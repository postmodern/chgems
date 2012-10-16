function chgems()
{
	case "$1" in
		-h|--help)
			echo "usage: chgems [ROOT [COMMAND [ARGS]...]]"
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
	local gem_path

	eval `ruby - <<EOF
require 'rubygems'
puts "ruby_engine=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'}"
puts "ruby_version=#{RUBY_VERSION}"
puts "gem_path=\"#{Gem.path.join(':')}\""
EOF`

	local gem_dir="$root/.gem/$ruby_engine/$ruby_version"

	(
		cd "$root"
		export PATH="$gem_dir/bin:$PATH"
		export GEM_HOME="$gem_dir"
		export GEM_PATH="$gem_dir:$gem_path"
		export PS1="$(basename "$root")> $PS1"

		if [[ -n "${command[@]}" ]]; then eval $command
		else                              exec $SHELL
		fi
	)
}
