note

	description:

		"Test 'scalc' example"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class PR_ETEST_SCALC

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "scalc"
			-- Program name

	library_name: STRING = "parse"
			-- Library name of example

feature -- Test

	test_scalc
			-- Test 'scalc' example.
		do
			compile_program
			file_system.copy_file (scalc_input_filename, input_text_filename)
			assert_execute (program_exe + input_text + output_log)
			assert ("expected_output", file_system.same_text_files (scalc_output_filename, output_log_filename))
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

	scalc_input_filename: STRING
			-- Name of calculator input file
		once
			Result := file_system.pathname (data_dirname, "scalc_input.txt")
		ensure
			scalc_input_filename_not_void: Result /= Void
			scalc_input_filename_not_empty: Result.count > 0
		end

	scalc_output_filename: STRING
			-- Name of calculator input file
		once
			Result := file_system.pathname (data_dirname, "scalc_output.txt")
		ensure
			scalc_output_filename_not_void: Result /= Void
			scalc_output_filename_not_empty: Result.count > 0
		end

end
