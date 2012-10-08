#!/usr/share/shunit2/shunit2

. ./test/helper.sh

function test_chgems_path_does_not_exist()
{
	chgems "does/not/exist" 2>/dev/null

	assertEquals "did not return 1" 1 $?
}

function test_chgems_path_is_not_directory()
{
	chgems "./test/helper.sh" 2>/dev/null

	assertEquals "did not return 1" 1 $?
}

function test_chgems_executing_command()
{
	local expected="success"
	local output=$(chgems "$TEST_DIR" "echo -n $expected")

	assertEquals "failed to run the command" "$output" "$expected"
}

function test_chgems_command_return_value()
{
	chgems "$TEST_DIR" "false"

	assertEquals "did not return the return value of the command" \
		     1 $?
}

function test_chgems_with_relative_path()
{
	local absolute_path="$TEST_DIR"
	local relative_path=$(basename "$absolute_path")
	local new_cwd=$(chgems "$relative_path" 'echo -n $PWD')

	assertEquals "failed to expand the relative path" \
	             "$absolute_path" "$new_cwd"
}

function test_chgems_with_absolute_path()
{
	local absolute_path="$TEST_DIR"
	local new_cwd=$(chgems "$absolute_path" 'echo -n $PWD')

	assertEquals "failed to expand the relative path" \
		     "$absolute_path" "$new_cwd"
}

function test_chgems_changing_directories()
{
	local expected="$PWD"

	chgems $TEST_DIR "true"

	assertEquals "did not return the previous directory" "$expected" "$PWD"
}

function test_chgems_PATH()
{
	local expected="$TEST_GEM_DIR/bin:$PATH"
	local new_path=$(chgems "$TEST_DIR" 'echo -n $PATH')

	assertEquals "did not add the gem dir to the PATH" \
		     "$expected" "$new_path"
}

function test_chgems_GEM_HOME()
{
	local new_gem_home=$(chgems "$TEST_DIR" 'echo -n $GEM_HOME')

	assertEquals "did not set the correct GEM_HOME" \
		     "$TEST_GEM_DIR" "$new_gem_home"
}

function test_chgems_GEM_PATH()
{
	local expected="$TEST_GEM_DIR:$TEST_GEM_HOME:$TEST_GEM_ROOT"
	local new_gem_path=$(chgems "$TEST_DIR" 'echo -n $GEM_PATH')

	assertEquals "did not prepend the gem directory to GEM_PATH" \
		     "$expected" "$new_gem_path"
}

function test_chgems_PS1()
{
	local expected="$TEST_NAME> $PS1"
	local new_ps1=$(chgems "$TEST_DIR" 'echo -n $PS1')

	assertEquals "did not prepend the gem directory name to PS1" \
		     "$expected" "$new_ps1"
}
