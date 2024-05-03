note

	description:

		"Test 'xslt/serializer' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2007-2024, Eric Bezault and others"
	license: "MIT License"

class XM_ETEST_SERIALIZER

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING = "serializer"
			-- Program name

	library_name: STRING = "xslt"
			-- Library name of example

feature -- Test

	test_serializer
			-- Test 'xslt/serializer' example.
		do
			compile_program
				-- Run example.
			assert_execute_with_command_output (program_exe + " --omit-xml-declaration=yes " + input_filename + output2_log, output2_log_filename, error2_log_filename)
			assert_files_equal ("output_log", input_filename, output2_log_filename)
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error2_log_filename))
		end

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "example", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

	data_dirname: STRING
			-- Name of data directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "test", "example", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	input_filename: STRING
			-- Name of input document
		do
			Result := file_system.pathname (data_dirname, "doc.xml")
		ensure
			input_filename_not_void: Result /= Void
			input_filename_not_empty: not Result.is_empty
		end

end
