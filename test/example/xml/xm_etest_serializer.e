indexing

	description:

		"Test 'xslt/serializer' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_ETEST_SERIALIZER

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

feature -- Access

	program_name: STRING is "serializer"
			-- Program name

	library_name: STRING is "xml"
			-- Library name of example

feature -- Test

	test_serializer is
			-- Test 'xslt/serializer' example.
		do
			compile_program
				-- Run example.
			assert_execute (program_exe + " --omit-xml-declaration=yes " + input_filename + output_log)
			assert_files_equal ("output_log", input_filename, output_log_filename)
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
		end

feature {NONE} -- Implementation

	program_dirname: STRING is
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library_name, "xslt", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

	input_filename: STRING is
			-- Name of input document
		do
			Result := file_system.pathname (program_dirname, "doc.xml")
		ensure
			input_filename_not_void: Result /= Void
			input_filename_not_empty: not Result.is_empty
		end

end
