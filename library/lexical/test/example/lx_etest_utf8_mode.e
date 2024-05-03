note

	description:

		"Test Unicode utf8 mode example"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2019-2024, Eric Bezault and others"
	license: "MIT License"

class LX_ETEST_UTF8_MODE

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING = "utf8_mode"
			-- Program name

	library_name: STRING = "lexical"
			-- Library name of example

feature -- Test

	test_utf8_mode
			-- Test 'utf8_mode' example.
		local
			byte_scanner_exe: STRING
		do
			compile_program
				-- Run example.
			byte_scanner_exe := program_exe
				-- Input1.
			assert_execute_with_command_output (byte_scanner_exe + " " + input1_filename + " output.txt" + output2_log, output2_log_filename, error2_log_filename)
			if file_system.file_count (output2_log_filename) = 0 then
				assert ("no_output_log", True)
			elseif file_system.same_text_files (freeise_log_filename, output2_log_filename) then
					-- Free version of ISE Eiffel?
				assert ("freeise_no_output_log", True)
			else
				assert_integers_equal ("no_output_log2", 0, file_system.file_count (output2_log_filename))
			end
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error2_log_filename))
			assert_files_equal ("diff", output1_filename, "output.txt")
				-- Input2.
			assert_execute_with_command_output (byte_scanner_exe + " " + input2_filename + " output.txt" + output3_log, output3_log_filename, error3_log_filename)
			if file_system.file_count (output3_log_filename) = 0 then
				assert ("no_output_log", True)
			elseif file_system.same_text_files (freeise_log_filename, output3_log_filename) then
					-- Free version of ISE Eiffel?
				assert ("freeise_no_output_log", True)
			else
				assert_integers_equal ("no_output_log2", 0, file_system.file_count (output3_log_filename))
			end
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error3_log_filename))
			assert_files_equal ("diff", output2_filename, "output.txt")
		end

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "example", "unicode", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

	data_dirname: STRING
			-- Name of directory where input and output files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "lexical", "example", "unicode", program_name, "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	input1_filename: STRING
			-- Name of input1 file
		once
			Result := file_system.pathname (data_dirname, "input1.txt")
		ensure
			input1_filename_not_void: Result /= Void
			input1_filename_not_empty: Result.count > 0
		end

	input2_filename: STRING
			-- Name of input2 file
		once
			Result := file_system.pathname (data_dirname, "input2.txt")
		ensure
			input2_filename_not_void: Result /= Void
			input2_filename_not_empty: Result.count > 0
		end

	output1_filename: STRING
			-- Name of output1 file
		once
			Result := file_system.pathname (data_dirname, "output1.txt")
		ensure
			output1_filename_not_void: Result /= Void
			output1_filename_not_empty: Result.count > 0
		end

	output2_filename: STRING
			-- Name of output2 file
		once
			Result := file_system.pathname (data_dirname, "output2.txt")
		ensure
			output2_filename_not_void: Result /= Void
			output2_filename_not_empty: Result.count > 0
		end

end
