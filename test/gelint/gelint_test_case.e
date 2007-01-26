indexing

	description:

		"Gelint test cases"

	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class GELINT_TEST_CASE

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

feature {NONE} -- Test

	compile_and_test (a_test_name: STRING) is
			-- Compile and test `a_test_name'.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			tested_eiffel_tool: STRING
		do
			tested_eiffel_tool := eiffel_compiler.vendor
			if tested_eiffel_tool.is_equal ("se") then
				compile_and_test_se (a_test_name)
			elseif tested_eiffel_tool.is_equal ("ise") then
				compile_and_test_ise (a_test_name)
			elseif tested_eiffel_tool.is_equal ("ve") then
				compile_and_test_ve (a_test_name)
			elseif tested_eiffel_tool.is_equal ("gelint") then
				compile_and_test_gelint (a_test_name)
			else
				assert ("unknown eiffel tool: " + tested_eiffel_tool, False)
			end
		end

	execute_shell (a_shell_command: STRING) is
			-- Execute `a_shell_command'.
		require
			a_shell_command_not_void: a_shell_command /= Void
			a_shell_command_not_empty: a_shell_command.count > 0
		local
			a_command: DP_SHELL_COMMAND
		do
			create a_command.make (a_shell_command)
			a_command.execute
		end

	are_output_files_equal (a_filename1, a_filename2: STRING): BOOLEAN is
			-- Is there no difference between the files named
			-- `a_filename1' and `a_filename2'?
			-- (Expand environment variables in filenames.)
		require
			a_filename1_not_void: a_filename1 /= Void
			a_filename1_not_empty: a_filename1.count > 0
			a_filename2_not_void: a_filename2 /= Void
			a_filename2_not_empty: a_filename2.count > 0
		do
			Result := file_system.same_text_files (Execution_environment.interpreted_string (a_filename1), Execution_environment.interpreted_string (a_filename2))
		end

feature {NONE} -- Test SmartEiffel

	compile_and_test_se (a_test_name: STRING) is
			-- Compile and test `a_test_name' with SmartEiffel.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			a_debug: STRING
			a_geant_filename: STRING
			a_filename: STRING
			successful, done: BOOLEAN
			i: INTEGER
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename (a_test_name)
				-- Compile program.
			execute_shell ("geant -b " + a_geant_filename + " compile_" + a_debug + "se" + output1_log)
			concat_output1_se
				-- Execute program.
			if file_system.file_exists (program_exe) then
				execute_shell (program_exe + output2_log)
				concat_output2_se
			end
				-- Clean.
			execute_shell ("geant -b " + a_geant_filename + " clobber" + output3_log)
			concat_output3_se
				-- Test.
			from
				i := 1
			until
				done
			loop
				a_filename := file_system.nested_pathname (rule_dirname, <<a_test_name, "output" + i.out + ".se">>)
				if file_system.file_exists (a_filename) then
					if are_output_files_equal (output_log_filename, a_filename) then
						done := True
						successful := True
						assert ("test successful", True)
					else
						i := i + 1
					end
				else
					done := True
				end
			end
			if not successful then
				assert ("unknown test result", False)
			end
		end

	concat_output1_se is
			-- Concat the logs of the compilation to 'output.log'.
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			in_filename: STRING
			a_line: STRING
			a_pattern1, a_pattern2: STRING
			a_regexp1, a_regexp2: RX_PCRE_REGULAR_EXPRESSION
			done: BOOLEAN
		do
				-- Compile regexps.
			a_pattern1 := "\((.*[^a-zA-Z0-9_])?([a-zA-Z0-9_]+\.e)\)"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
			a_pattern2 := "File %"[^%"\n]+%" not found. Error\(s\) during `compile_to_c'\."
			create a_regexp2.make
			a_regexp2.compile (a_pattern2)
			assert ("cannot compile regexp '" + a_pattern2 + "'", a_regexp2.is_compiled)
			a_regexp2.optimize
				-- Copy files.
			create out_file.make (output_log_filename)
			out_file.open_write
			if out_file.is_open_write then
				from
					in_filename := output1_log_filename
				until
					in_filename = Void
				loop
					create in_file.make (in_filename)
					in_file.open_read
					if in_file.is_open_read then
						from
							done := False
							in_file.read_line
						until
							done or
							in_file.end_of_file
						loop
							a_line := in_file.last_string
							if a_regexp2.recognizes (a_line) then
								done := True
							else
								a_regexp1.match (a_line)
								a_line := a_regexp1.replace_all ("(\2\)")
								out_file.put_line (a_line)
								in_file.read_line
							end
						end
						in_file.close
					else
						assert ("cannot open file '" + in_filename + "'", False)
					end
					if in_filename = output1_log_filename then
						in_filename := error1_log_filename
					else
						in_filename := Void
					end
				end
				out_file.close
			else
				assert ("cannot open file '" + output_log_filename + "'", False)
			end
		end

	concat_output2_se is
			-- Concat the logs of the execution to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output2_log_filename)
			file_system.concat_files (output_log_filename, error2_log_filename)
		end

	concat_output3_se is
			-- Concat the logs of the cleaning to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output3_log_filename)
			file_system.concat_files (output_log_filename, error3_log_filename)
		end

feature {NONE} -- Test ISE Eiffel

	compile_and_test_ise (a_test_name: STRING) is
			-- Compile and test `a_test_name' with ISE Eiffel.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			a_debug: STRING
			a_geant_filename: STRING
			a_filename: STRING
			successful, done: BOOLEAN
			i: INTEGER
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename (a_test_name)
				-- Compile program.
			execute_shell ("geant -b " + a_geant_filename + " compile_" + a_debug + "ise" + output1_log)
			concat_output1_ise
				-- Execute program.
			if file_system.file_exists (program_exe) then
				execute_shell (program_exe + output2_log)
				concat_output2_ise
			end
				-- Clean.
			execute_shell ("geant -b " + a_geant_filename + " clobber" + output3_log)
			concat_output3_ise
				-- Test.
			from
				i := 1
			until
				done
			loop
				a_filename := file_system.nested_pathname (rule_dirname, <<a_test_name, "output" + i.out + ".ise">>)
				if file_system.file_exists (a_filename) then
					if are_output_files_equal (output_log_filename, a_filename) then
						done := True
						successful := True
						assert ("test successful", True)
					else
						i := i + 1
					end
				else
					done := True
				end
			end
			if not successful then
				assert ("unknown test result", False)
			end
		end

	concat_output1_ise is
			-- Concat the logs of the compilation to 'output.log'.
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			in_filename: STRING
			a_line: STRING
			a_pattern1, a_pattern2, a_pattern3: STRING
			a_regexp1, a_regexp2, a_regexp3: RX_PCRE_REGULAR_EXPRESSION
			done: BOOLEAN
			has_empty_line: BOOLEAN
		do
				-- Compile regexps.
			a_pattern1 := "BUILD FAILED!"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
			a_pattern2 := "\(version .*\)"
			create a_regexp2.make
			a_regexp2.compile (a_pattern2)
			assert ("cannot compile regexp '" + a_pattern2 + "'", a_regexp2.is_compiled)
			a_regexp2.optimize
			a_pattern3 := "\[ *[0-9]+%% - *[0-9]+\] Degree [0-9]+"
			create a_regexp3.make
			a_regexp3.compile (a_pattern3)
			assert ("cannot compile regexp '" + a_pattern3 + "'", a_regexp3.is_compiled)
			a_regexp3.optimize
				-- Copy files.
			create out_file.make (output_log_filename)
			out_file.open_write
			if out_file.is_open_write then
				from
					in_filename := output1_log_filename
				until
					in_filename = Void
				loop
					create in_file.make (in_filename)
					in_file.open_read
					if in_file.is_open_read then
						from
							done := False
							in_file.read_line
						until
							done or
							in_file.end_of_file
						loop
							a_line := in_file.last_string
							if a_regexp1.recognizes (a_line) then
								done := True
							elseif a_regexp2.matches (a_line) then
									-- Skip it.
								in_file.read_line
							elseif a_regexp3.matches (a_line) then
									-- Skip it.
								in_file.read_line
							elseif a_line.count = 0 then
								has_empty_line := True
								in_file.read_line
							else
								if has_empty_line then
									out_file.put_new_line
									has_empty_line := False
								end
								out_file.put_line (a_line)
								in_file.read_line
							end
						end
						if has_empty_line then
							if not done then
								out_file.put_new_line
							end
							has_empty_line := False
						end
						in_file.close
					else
						out_file.close
						assert ("cannot open file '" + in_filename + "'", False)
					end
					if in_filename = output1_log_filename then
						in_filename := error1_log_filename
					else
						in_filename := Void
					end
				end
				out_file.close
			else
				assert ("cannot open file '" + output_log_filename + "'", False)
			end
		end

	concat_output2_ise is
			-- Concat the logs of the execution to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output2_log_filename)
			file_system.concat_files (output_log_filename, error2_log_filename)
		end

	concat_output3_ise is
			-- Concat the logs of the cleaning to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output3_log_filename)
			file_system.concat_files (output_log_filename, error3_log_filename)
		end

feature {NONE} -- Test Visual Eiffel

	compile_and_test_ve (a_test_name: STRING) is
			-- Compile and test `a_test_name' with Visual Eiffel.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			a_debug: STRING
			a_geant_filename: STRING
			a_filename: STRING
			successful, done: BOOLEAN
			i: INTEGER
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename (a_test_name)
				-- Compile program.
			execute_shell ("geant -b " + a_geant_filename + " compile_" + a_debug + "ve" + output1_log)
			concat_output1_ve
				-- Execute program.
			if file_system.file_exists (program_exe) then
				execute_shell (program_exe + output2_log)
				concat_output2_ve
			end
				-- Clean.
			execute_shell ("geant -b " + a_geant_filename + " clobber" + output3_log)
			concat_output3_ve
				-- Test.
			from
				i := 1
			until
				done
			loop
				a_filename := file_system.nested_pathname (rule_dirname, <<a_test_name, "output" + i.out + ".ve">>)
				if file_system.file_exists (a_filename) then
					if are_output_files_equal (output_log_filename, a_filename) then
						done := True
						successful := True
						assert ("test successful", True)
					else
						i := i + 1
					end
				else
					done := True
				end
			end
			if not successful then
				assert ("unknown test result", False)
			end
		end

	concat_output1_ve is
			-- Concat the logs of the compilation to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output1_log_filename)
			file_system.concat_files (output_log_filename, error1_log_filename)
		end

	concat_output2_ve is
			-- Concat the logs of the execution to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output2_log_filename)
			file_system.concat_files (output_log_filename, error2_log_filename)
		end

	concat_output3_ve is
			-- Concat the logs of the cleaning to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output3_log_filename)
			file_system.concat_files (output_log_filename, error3_log_filename)
		end

feature {NONE} -- Test gelint

	compile_and_test_gelint (a_test_name: STRING) is
			-- Compile and test `a_test_name' with gelint.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			a_debug: STRING
			an_xace_filename: STRING
			a_filename: STRING
			successful, done: BOOLEAN
			i: INTEGER
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			an_xace_filename := xace_filename (a_test_name)
			execute_shell ("gelint " + an_xace_filename + output1_log)
			concat_output1_gelint
				-- Test.
			from
				i := 1
			until
				done
			loop
				a_filename := file_system.nested_pathname (rule_dirname, <<a_test_name, "output" + i.out + ".gelint">>)
				if file_system.file_exists (a_filename) then
					if are_output_files_equal (output_log_filename, a_filename) then
						done := True
						successful := True
						assert ("test successful", True)
					else
						i := i + 1
					end
				else
					done := True
				end
			end
			if not successful then
				assert ("unknown test result", False)
			end
		end

	concat_output1_gelint is
			-- Concat the logs of gelint to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output1_log_filename)
			file_system.concat_files (output_log_filename, error1_log_filename)
		end

feature -- Execution

	set_up is
			-- Setup for a test.
		local
			a_testdir: STRING
		do
			a_testdir := testdir
			-- assert (a_testdir + "_not_exists", not file_system.directory_exists (a_testdir))
			old_cwd := file_system.cwd
			file_system.create_directory (a_testdir)
			assert (a_testdir + "_exists", file_system.directory_exists (a_testdir))
			file_system.cd (a_testdir)
		end

	tear_down is
			-- Tear down after a test.
		do
			if old_cwd /= Void then
				file_system.cd (old_cwd)
				-- file_system.recursive_delete_directory (testdir)
				old_cwd := Void
			end
		end

	old_cwd: STRING
			-- Initial current working directory

feature {NONE} -- Implementation

	program_name: STRING is
			-- Program name
		once
			Result := "aa"
		ensure
			program_name_not_void: Result /= Void
			program_name_not_empty: Result.count > 0
		end

	rule_dirname: STRING is
			-- Name of the directory containing the tests of the rule being tested
		deferred
		ensure
			rule_dirname_not_void: Result /= Void
			rule_dirname_not_empty: Result.count > 0
		end

	program_dirname (a_test_name: STRING): STRING is
			-- Name of program source directory for `a_test_name'
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		do
			Result := file_system.pathname (rule_dirname, a_test_name)
		ensure
			program_dirname_not_void: Result /= Void
			program_dirname_not_empty: Result.count > 0
		end

	program_exe: STRING is
			-- Name of program executable filename
		do
			Result := file_system.pathname (file_system.relative_current_directory, program_name + file_system.exe_extension)
		ensure
			program_exe_not_void: Result /= Void
			program_exe_not_empty: Result.count > 0
		end

	geant_filename (a_test_name: STRING): STRING is
			-- Name of geant build file used for compilation of `a_test_name'
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		do
			Result := file_system.pathname (program_dirname (a_test_name), "build.eant")
		ensure
			geant_filename_not_void: Result /= Void
			geant_filename_not_empty: Result.count > 0
		end

	xace_filename (a_test_name: STRING): STRING is
			-- Name of Xace file used for compilation of `a_test_name'
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		do
			Result := file_system.pathname (program_dirname (a_test_name), "system.xace")
		ensure
			xace_filename_not_void: Result /= Void
			xace_filename_not_empty: Result.count > 0
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "Tgelint"
		ensure
			testdir_not_void: Result /= Void
			testdir_not_empty: Result.count > 0
		end

	output_log_filename: STRING is "output.log"
			-- Test output log filename

	output1_log_filename: STRING is "output1.log"
			-- Compilation output log filename

	error1_log_filename: STRING is "error1.log"
			-- Compilation error log filename

	output1_log: STRING is
			-- Where and how to redirect compilation output logs
		once
			Result := " > " + output1_log_filename + " 2> " + error1_log_filename
		ensure
			output1_log_not_void: Result /= Void
			output1_log_not_empty: Result.count > 0
		end

	output2_log_filename: STRING is "output2.log"
			-- Execution output log filename

	error2_log_filename: STRING is "error2.log"
			-- Execution error log filename

	output2_log: STRING is
			-- Where and how to redirect execution output logs
		once
			Result := " > " + output2_log_filename + " 2> " + error2_log_filename
		ensure
			output2_log_not_void: Result /= Void
			output2_log_not_empty: Result.count > 0
		end

	output3_log_filename: STRING is "output3.log"
			-- Cleaning output log filename

	error3_log_filename: STRING is "error3.log"
			-- Cleaning error log filename

	output3_log: STRING is
			-- Where and how to redirect cleaning output logs
		once
			Result := " > " + output3_log_filename + " 2> " + error3_log_filename
		ensure
			output3_log_not_void: Result /= Void
			output3_log_not_empty: Result.count > 0
		end

end
