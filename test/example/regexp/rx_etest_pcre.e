indexing

	description:

		"Test 'pcre' example"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class RX_ETEST_PCRE

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	program_name: STRING is "pcre"
			-- Program name

	library_name: STRING is "regexp"
			-- Library name of example

feature -- Test

	test_pcre is
			-- Test 'pcre' example.
		local
			pcre_exe: STRING
		do
			compile_program
				-- Run example.
			pcre_exe := program_exe
			assert_execute (pcre_exe + output_log)
			assert_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
			assert_files_equal ("diff", pcre_filename, output_log_filename)
		end

feature {NONE} -- Implementation

	data_dirname: STRING is
			-- Name of directory where data files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "example", "regexp", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	pcre_filename: STRING is
			-- Name of expected output file
		once
			Result := file_system.pathname (data_dirname, "pcre.txt")
		ensure
			pcre_filename_not_void: Result /= Void
			pcre_filename_not_empty: Result.count > 0
		end

end
