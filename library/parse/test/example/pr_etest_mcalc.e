note

	description:

		"Test 'mcalc' example"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"

class PR_ETEST_MCALC

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "mcalc"
			-- Program name

	library_name: STRING = "parse"
			-- Library name of example

feature -- Test

	test_mcalc
			-- Test 'mcalc' example.
		do
			compile_program
			file_system.copy_file (mcalc_input_filename, input_text_filename)
			assert_execute (program_exe + input_text + output_log)
			assert ("expected_output", file_system.same_text_files (mcalc_output_filename, output_log_filename))
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

	mcalc_input_filename: STRING
			-- Name of calculator input file
		once
			Result := file_system.pathname (data_dirname, "mcalc_input.txt")
		ensure
			mcalc_input_filename_not_void: Result /= Void
			mcalc_input_filename_not_empty: Result.count > 0
		end

	mcalc_output_filename: STRING
			-- Name of calculator input file
		once
			Result := file_system.pathname (data_dirname, "mcalc_output.txt")
		ensure
			mcalc_output_filename_not_void: Result /= Void
			mcalc_output_filename_not_empty: Result.count > 0
		end

end
