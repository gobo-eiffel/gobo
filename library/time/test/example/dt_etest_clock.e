note

	description:

		"Test 'clock' example"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001-2024, Eric Bezault and others"
	license: "MIT License"

class DT_ETEST_CLOCK

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "clock"
			-- Program name

	library_name: STRING = "time"
			-- Library name of example

feature -- Test

	test_clock
			-- Test 'clock' example.
		local
			clock_exe: STRING
		do
			compile_program
				-- Run example.
			clock_exe := program_exe
			assert_execute_with_command_output (clock_exe + output2_log, output2_log_filename, error2_log_filename)
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error2_log_filename))
		end

end
