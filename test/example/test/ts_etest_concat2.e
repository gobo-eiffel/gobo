indexing

	description:

		"Test 'concat2' example"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TS_ETEST_CONCAT2

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "concat2"
			-- Example name

	library: STRING is "test"
			-- Library name of example

feature -- Test

	test_concat2 is
			-- Test 'concat2' example.
		local
			a_debug: STRING
			a_geant_filename: STRING
		do
				-- Run example.
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename
			assert_execute ("geant -b " + a_geant_filename + " test_" + a_debug + eiffel_compiler.vendor + " " + output_log)
				-- Check result.
			assert_files_equal ("output", expected_output, output_log_filename)
			assert_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
				-- Clean.
			assert_execute ("geant -b " + a_geant_filename + " clean" + output_log)
		end

feature {NONE} -- Implementation

	expected_output: STRING is
			-- Name of file containing expected output
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "example", "test", "data", "concat2.log">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			expected_output_not_void: Result /= Void
			expected_output_not_empty: Result.count > 0
		end

end -- class TS_ETEST_CONCAT2
