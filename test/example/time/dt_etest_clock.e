indexing

	description:

		"Test 'clock' example"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_ETEST_CLOCK

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "clock"
			-- Example name

	library: STRING is "time"
			-- Library name of example

feature -- Test

	test_clock is
			-- Test 'clock' example.
		local
			clock_exe: STRING
		do
			compile_example
				-- Run example.
			clock_exe := example_exe
			assert_execute (clock_exe + output_log)
			assert_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
		end

end -- class DT_ETEST_CLOCK
