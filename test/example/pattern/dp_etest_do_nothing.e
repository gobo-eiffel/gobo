indexing

	description:

		"Test 'singleton/do_nothing' example"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DP_ETEST_DO_NOTHING

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING is "do_nothing"
			-- Program name

	library_name: STRING is "pattern"
			-- Library name of example

feature -- Test

	test_do_nothing is
			-- Test 'singleton/do_nothing' example.
		local
			do_nothing_exe: STRING
		do
			compile_program
				-- Run example.
			do_nothing_exe := program_exe
			assert_execute (do_nothing_exe + output_log)
			if file_system.same_text_files (do_nothing_log_filename, output_log_filename) then
				assert ("output_log", True)
			else
					-- Free version of ISE Eiffel?
				file_system.delete_file (freeise_do_nothing_log_filename)
				file_system.concat_files (freeise_do_nothing_log_filename, freeise_log_filename)
				file_system.concat_files (freeise_do_nothing_log_filename, do_nothing_log_filename)
				if file_system.same_text_files (freeise_do_nothing_log_filename, output_log_filename) then
					assert ("freeise_output_log", True)
				else
					assert_files_equal ("output_log2", do_nothing_log_filename, output_log_filename)
				end
			end
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
		end

feature {NONE} -- Implementation

	program_dirname: STRING is
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library_name, "singleton", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

	data_dirname: STRING is
			-- Name of directory where data files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "example", "pattern", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	do_nothing_log_filename: STRING is
			-- Name of file containing expected output
		once
			Result := file_system.pathname (data_dirname, "do_nothing.log")
		ensure
			do_nothing_log_filename_not_void: Result /= Void
			do_nothing_log_filename_not_empty: Result.count > 0
		end

	freeise_do_nothing_log_filename: STRING is "output2.log"
			-- Name of file containing expected output
			-- when run with the free version of ISE Eiffel
			-- under Linux/Unix

end
