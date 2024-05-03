note

	description:

		"Test 'rpcalc' example"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001-2024, Eric Bezault and others"
	license: "MIT License"

class PR_ETEST_RPCALC

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "rpcalc"
			-- Program name

	library_name: STRING = "parse"
			-- Library name of example

feature -- Test

	test_rpcalc
			-- Test 'rpcalc' example.
		do
			compile_program
			file_system.copy_file (rpcalc_input_filename, input_text_filename)
			assert_execute_with_command_output (program_exe + input_text + output2_log, output2_log_filename, error2_log_filename)
			assert ("expected_output", file_system.same_text_files (rpcalc_output_filename, output2_log_filename))
		end

feature {NONE} -- Implementation

	data_dirname: STRING
			-- Name of directory where data files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "parse", "test", "example", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	rpcalc_input_filename: STRING
			-- Name of calculator input file
		once
			Result := file_system.pathname (data_dirname, "rpcalc_input.txt")
		ensure
			rpcalc_input_filename_not_void: Result /= Void
			rpcalc_input_filename_not_empty: Result.count > 0
		end

	rpcalc_output_filename: STRING
			-- Name of calculator input file
		once
			Result := file_system.pathname (data_dirname, "rpcalc_output.txt")
		ensure
			rpcalc_output_filename_not_void: Result /= Void
			rpcalc_output_filename_not_empty: Result.count > 0
		end

end
