indexing

	description:

		"Run 'pcretest'"

	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_TEST_PCRETEST

inherit

	PROGRAM_TEST_CASE

create

	make_default

feature -- Test

	test_pcretest is
			-- Run 'pcretest'.
		do
			compile_program
			assert_execute (program_exe + output_log)
			if file_system.file_count (output_log_filename) = 0 then
				assert ("no_output_log", True)
			elseif file_system.same_text_files (freeise_log_filename, output_log_filename) then
					-- Free version of ISE Eiffel?
				assert ("freeise_no_output_log", True)
			else
				assert_integers_equal ("no_output_log2", 0, file_system.file_count (output_log_filename))
			end
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error_log_filename))
			assert_files_equal ("diff1", testoutput1_filename, "out1")
			assert_files_equal ("diff2", testoutput2_filename, "out2")
			assert_files_equal ("diff3", testoutput3_filename, "out3")
		end

feature -- Access

	program_name: STRING is "pcretest"
			-- Program name

feature {NONE} -- Filenames

	program_dirname: STRING is
			-- Name of program source directory
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "regexp", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

	data_dirname: STRING is
			-- Name of directory containing expected output files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "regexp", "pcretest", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	testoutput1_filename: STRING is
			-- Name of first test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput1")
		ensure
			testoutput1_filename_not_void: Result /= Void
			testoutput1_filename_not_empty: Result.count > 0
		end

	testoutput2_filename: STRING is
			-- Name of second test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput2")
		ensure
			testoutput2_filename_not_void: Result /= Void
			testoutput2_filename_not_empty: Result.count > 0
		end

	testoutput3_filename: STRING is
			-- Name of third test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput3")
		ensure
			testoutput3_filename_not_void: Result /= Void
			testoutput3_filename_not_empty: Result.count > 0
		end

	testoutput4_filename: STRING is
			-- Name of forth test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput4")
		ensure
			testoutput4_filename_not_void: Result /= Void
			testoutput4_filename_not_empty: Result.count > 0
		end

	testoutput5_filename: STRING is
			-- Name of fifth test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput5")
		ensure
			testoutput5_filename_not_void: Result /= Void
			testoutput5_filename_not_empty: Result.count > 0
		end

	testoutput6_filename: STRING is
			-- Name of sixth test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput6")
		ensure
			testoutput6_filename_not_void: Result /= Void
			testoutput6_filename_not_empty: Result.count > 0
		end

end
