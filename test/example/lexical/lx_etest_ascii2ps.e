indexing

	description:

		"Test 'ascii2ps' example"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_ETEST_ASCII2PS

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "ascii2ps"
			-- Example name

	library: STRING is "lexical"
			-- Library name of example

feature -- Test

	test_ascii2ps is
			-- Test 'ascii2ps' example.
		local
			ascii2ps_exe: STRING
		do
			compile_example
				-- Run example.
			ascii2ps_exe := example_exe
			assert_execute (ascii2ps_exe + " " + sample_e_filename + " toto.ps" + output_log)
			assert_equal ("no_output_log", 0, file_system.file_count (output_log_filename))
			assert_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
			assert_files_equal ("diff", sample_ps_filename, "toto.ps")
		end

feature {NONE} -- Implementation

	sample_dirname: STRING is
			-- Name of directory where sample files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "example", "lexical", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			sample_dirname_not_void: Result /= Void
			sample_dirname_not_empty: Result.count > 0
		end

	sample_e_filename: STRING is
			-- Name of sample Eiffel file
		once
			Result := file_system.pathname (sample_dirname, "sample.e")
		ensure
			sample_e_filename_not_void: Result /= Void
			sample_e_filename_not_empty: Result.count > 0
		end

	sample_ps_filename: STRING is
			-- Name of sample Postscrit file
		once
			Result := file_system.pathname (sample_dirname, "sample.ps")
		ensure
			sample_ps_filename_not_void: Result /= Void
			sample_ps_filename_not_empty: Result.count > 0
		end

end -- class LX_ETEST_ASCII2PS
