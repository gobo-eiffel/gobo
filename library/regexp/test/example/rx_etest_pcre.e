note

	description:

		"Test 'pcre' example"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002-2016, Eric Bezault and others"
	license: "MIT License"

class RX_ETEST_PCRE

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "pcre"
			-- Program name

	library_name: STRING = "regexp"
			-- Library name of example

feature -- Test

	test_pcre
			-- Test 'pcre' example.
		local
			pcre_exe: STRING
		do
			compile_program
				-- Run example.
			pcre_exe := program_exe
			assert_execute (pcre_exe + output_log)
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
			if file_system.same_text_files (pcre_filename, output_log_filename) then
				assert ("diff", True)
			else
					-- Free version of ISE Eiffel?
				file_system.delete_file (freeise_pcre_filename)
				file_system.concat_files (freeise_pcre_filename, freeise_log_filename)
				file_system.concat_files (freeise_pcre_filename, pcre_filename)
				if file_system.same_text_files (freeise_pcre_filename, output_log_filename) then
					assert ("freeise_diff", True)
				else
					assert_files_equal ("diff2", pcre_filename, output_log_filename)
				end
			end
		end

feature {NONE} -- Implementation

	data_dirname: STRING
			-- Name of directory where data files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "regexp", "test", "example", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	pcre_filename: STRING
			-- Name of expected output file
		once
			Result := file_system.pathname (data_dirname, "pcre.txt")
		ensure
			pcre_filename_not_void: Result /= Void
			pcre_filename_not_empty: Result.count > 0
		end

	freeise_pcre_filename: STRING = "output2.log"
			-- Name of file containing expected output
			-- when run with the free version of ISE Eiffel
			-- under Linux/Unix

end
