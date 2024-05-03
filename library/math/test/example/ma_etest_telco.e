note

	description:

		"Test 'telco' benchmark"

	library: "Gobo Eiffel Math Library"
	copyright: "Copyright (c) 2005-2024, Eric Bezault and others"
	license: "MIT License"

class MA_ETEST_TELCO

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING = "telco"
			-- Program name

	library_name: STRING = "math"
			-- Library name of example

feature -- Test

	test_telco
			-- Test 'telco' benchmark.
		local
			telco_exe: STRING
			l_input_file: KL_TEXT_INPUT_FILE
			l_output_file: KL_TEXT_OUTPUT_FILE
			l_line: STRING
		do
			compile_program
				-- Run example.
			telco_exe := program_exe
			assert_execute_with_command_output (telco_exe + output2_log, output2_log_filename, error2_log_filename)
			assert_integers_equal ("no_error_log", 0, file_system.file_count (error2_log_filename))
			assert_files_equal ("diff", telco_outc_filename, "telco.outc")
			create l_input_file.make (output2_log_filename)
			l_input_file.open_read
			if not l_input_file.is_open_read then
				assert ("read_output_file", False)
			else
				create l_output_file.make ("telco.txt")
				l_output_file.open_write
				if not l_output_file.is_open_write then
					l_input_file.close
					assert ("write_output_file", False)
				else
					from
						l_input_file.read_line
					until
						l_input_file.end_of_file
					loop
						l_line := l_input_file.last_string
						if l_line.count > 9 and then l_line.substring (1, 9).is_equal ("Duration:") then
							l_output_file.put_line ("Duration: 0:0:0.0  - hour:minute:second.millisecond")
						else
							l_output_file.put_line (l_line)
						end
						l_input_file.read_line
					end
					l_input_file.close
					l_output_file.close
				end
			end
			assert_files_equal ("output_log", telco_txt_filename, "telco.txt")
		end

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "example", "decimal", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

	data_dirname: STRING
			-- Name of directory where expected files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "math", "test", "example", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	telco_outc_filename: STRING
			-- Name of expected output file
		once
			Result := file_system.pathname (data_dirname, "telco.outc")
		ensure
			telco_outc_filename_not_void: Result /= Void
			telco_outc_filename_not_empty: Result.count > 0
		end

	telco_txt_filename: STRING
			-- Name of expected output log file
		once
			Result := file_system.pathname (data_dirname, "telco.txt")
		ensure
			telco_txt_filename_not_void: Result /= Void
			telco_txt_filename_not_empty: Result.count > 0
		end

end
