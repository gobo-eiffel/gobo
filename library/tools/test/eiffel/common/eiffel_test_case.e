note

	description:

		"Eiffel standard test cases"

	copyright: "Copyright (c) 2002-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class EIFFEL_TEST_CASE

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

	compile_and_test (a_test_name: STRING)
			-- Compile and test `a_test_name'.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			tested_eiffel_tool: STRING
		do
			if variables.has ("test") then
				tested_eiffel_tool := variables.value ("test")
			else
				tested_eiffel_tool := eiffel_compiler.vendor
			end
			if tested_eiffel_tool.same_string ("ise") then
				compile_and_test_ise (a_test_name)
			elseif tested_eiffel_tool.same_string ("ge") then
				compile_and_test_gec (a_test_name)
			elseif tested_eiffel_tool.same_string ("gec") then
				compile_and_test_gec (a_test_name)
			elseif tested_eiffel_tool.same_string ("gelint") then
				compile_and_test_gelint (a_test_name)
			else
				assert ("unknown eiffel tool: " + tested_eiffel_tool, False)
			end
		end

	are_output_files_equal (a_filename1, a_filename2: STRING): BOOLEAN
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

feature {NONE} -- Test Gobo Eiffel Compiler

	compile_and_test_gec (a_test_name: STRING)
			-- Compile and test `a_test_name' with gec.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			a_debug: STRING
			a_geant_filename: STRING
			l_directory: KL_DIRECTORY
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename (a_test_name)
				-- Compile program.
			execute_shell ("geant -b " + a_geant_filename + " compile_" + a_debug + "ge" + output1_log)
			concat_output1 (agent filter_output_gec)
				-- Execute program.
			if file_system.file_exists (program_exe) then
				execute_shell (program_exe + output2_log)
				concat_output2
			end
				-- Clean.
			execute_shell ("geant -b " + a_geant_filename + " clobber" + output3_log)
			concat_output3
				-- Test.
			create l_directory.make (program_dirname (a_test_name))
			if l_directory.there_exists (agent output_recognized (?, l_directory, passed_filename_regexp ("gec"), output_log_filename)) then
				assert ("test_passed", True)
			elseif l_directory.there_exists (agent output_recognized (?, l_directory, failed_filename_regexp ("gec"), output_log_filename)) then
				assert ("test_failed", False)
			else
				assert ("unknown_test_result", False)
			end
		end

	filter_output_gec (an_input_filename, an_output_filename: STRING)
			-- Filter text from file `an_input_filename' and append it to the end of file `an_output_filename'.
		require
			an_input_filename_not_void: an_input_filename /= Void
			an_output_filename_not_void: an_output_filename /= Void
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_pattern1, a_pattern2: STRING
			a_regexp1, a_regexp2: RX_PCRE_REGULAR_EXPRESSION
			l_empty_line: BOOLEAN
		do
				-- Compile regexps.
			a_pattern1 := "BUILD FAILED!"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
			a_pattern2 := "aa[0-9]+\.c"
			create a_regexp2.make
			a_regexp2.compile (a_pattern2)
			assert ("cannot compile regexp '" + a_pattern2 + "'", a_regexp2.is_compiled)
			a_regexp2.optimize
				-- Copy files.
			create out_file.make (an_output_filename)
			out_file.open_append
			if out_file.is_open_write then
				create in_file.make (an_input_filename)
				in_file.open_read
				if in_file.is_open_read then
					from
						in_file.read_line
					until
						in_file.end_of_file
					loop
						a_line := in_file.last_string
						if a_line.is_empty then
							l_empty_line := True
						elseif a_regexp1.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp2.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						else
							if l_empty_line then
								out_file.put_new_line
								l_empty_line := False
							end
							out_file.put_line (a_line)
						end
						a_regexp1.wipe_out
						a_regexp2.wipe_out
						in_file.read_line
					end
					in_file.close
					if l_empty_line then
						out_file.put_new_line
						l_empty_line := False
					end
				else
					assert ("cannot open file '" + an_input_filename + "'", False)
				end
				out_file.close
			else
				assert ("cannot open file '" + an_output_filename + "'", False)
			end
		end

feature {NONE} -- Test gelint

	compile_and_test_gelint (a_test_name: STRING)
			-- Compile and test `a_test_name' with gelint.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			a_debug: STRING
			an_xace_filename: STRING
			l_directory: KL_DIRECTORY
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			an_xace_filename := xace_filename (a_test_name)
			execute_shell ("gelint --define=GOBO_EIFFEL=ge --flat --silent " + an_xace_filename + output1_log)
			concat_output1 (agent filter_output_gelint)
				-- Test.
			create l_directory.make (program_dirname (a_test_name))
			if l_directory.there_exists (agent output_recognized (?, l_directory, passed_filename_regexp ("gelint"), output_log_filename)) then
				assert ("test_passed", True)
			elseif l_directory.there_exists (agent output_recognized (?, l_directory, failed_filename_regexp ("gelint"), output_log_filename)) then
				assert ("test_failed", False)
			else
				assert ("unknown_test_result", False)
			end
		end

	filter_output_gelint (an_input_filename, an_output_filename: STRING)
			-- Filter text from file `an_input_filename' and append it to the end of file `an_output_filename'.
		require
			an_input_filename_not_void: an_input_filename /= Void
			an_output_filename_not_void: an_output_filename /= Void
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_pattern1: STRING
			a_regexp1: RX_PCRE_REGULAR_EXPRESSION
			l_empty_line: BOOLEAN
		do
				-- Compile regexps.
			a_pattern1 := "BUILD FAILED!"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
				-- Copy files.
			create out_file.make (an_output_filename)
			out_file.open_append
			if out_file.is_open_write then
				create in_file.make (an_input_filename)
				in_file.open_read
				if in_file.is_open_read then
					from
						in_file.read_line
					until
						in_file.end_of_file
					loop
						a_line := in_file.last_string
						if a_line.is_empty then
							l_empty_line := True
						elseif a_regexp1.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						else
							if l_empty_line then
								out_file.put_new_line
								l_empty_line := False
							end
							out_file.put_line (a_line)
						end
						a_regexp1.wipe_out
						in_file.read_line
					end
					in_file.close
					if l_empty_line then
						out_file.put_new_line
						l_empty_line := False
					end
				else
					assert ("cannot open file '" + an_input_filename + "'", False)
				end
				out_file.close
			else
				assert ("cannot open file '" + an_output_filename + "'", False)
			end
		end

feature {NONE} -- Test ISE Eiffel

	compile_and_test_ise (a_test_name: STRING)
			-- Compile and test `a_test_name' with ISE Eiffel.
		require
			a_test_not_void: a_test_name /= Void
			a_test_not_empty: a_test_name.count > 0
		local
			a_debug: STRING
			a_geant_filename: STRING
			l_directory: KL_DIRECTORY
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename (a_test_name)
				-- Compile program.
			execute_shell ("geant -b " + a_geant_filename + " compile_" + a_debug + "ise" + output1_log)
			concat_output1 (agent filter_output_ise)
				-- Execute program.
			if file_system.file_exists (program_exe) then
				execute_shell (program_exe + output2_log)
				concat_output2
			end
				-- Clean.
			execute_shell ("geant -b " + a_geant_filename + " clobber" + output3_log)
			concat_output3
				-- Test.
			create l_directory.make (program_dirname (a_test_name))
			if l_directory.there_exists (agent output_recognized (?, l_directory, passed_filename_regexp ("ise"), output_log_filename)) then
				assert ("test_passed", True)
			elseif l_directory.there_exists (agent output_recognized (?, l_directory, failed_filename_regexp ("ise"), output_log_filename)) then
				assert ("test_failed", False)
			else
				assert ("unknown_test_result", False)
			end
		end

	filter_output_ise (an_input_filename, an_output_filename: STRING)
			-- Filter text from file `an_input_filename' and append it to the end of file `an_output_filename'.
		require
			an_input_filename_not_void: an_input_filename /= Void
			an_output_filename_not_void: an_output_filename /= Void
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_pattern1, a_pattern2, a_pattern3, a_pattern4, a_pattern5, a_pattern6, a_pattern7, a_pattern8: STRING
			a_regexp1, a_regexp2, a_regexp3, a_regexp4, a_regexp5, a_regexp6, a_regexp7, a_regexp8: RX_PCRE_REGULAR_EXPRESSION
			l_empty_line: BOOLEAN
		do
				-- Compile regexps.
			a_pattern1 := "BUILD FAILED!"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
			a_pattern2 := "(\[ *[0-9]+%% - *[0-9]+\] (Degree -?[0-9]+|Generating Auxiliary Files))|(Features done: [0-9]+\sFeatures to go: [0-9]+)|(Degree 6: Examining System)|(Degree 5: Parsing Classes)|(Degree 4: Analyzing Inheritance)|(Degree 3: Checking Types)|(Degree 2: Generating Byte Code)|(Degree -1: Generating Code)|(Degree -2: Constructing Polymorphic Table)|(Degree -3: Generating Optimized Code)"
			create a_regexp2.make
			a_regexp2.compile (a_pattern2)
			assert ("cannot compile regexp '" + a_pattern2 + "'", a_regexp2.is_compiled)
			a_regexp2.optimize
			a_pattern3 := "(Eiffel Compilation Manager)|(Freezing System Changes)|(System Recompiled\.)|(C compilation completed)|(Preparing C compilation.*\.\.\.)|(Removing Dead Code)|(Removing Unused Code)|(\s*\(version .*\))|(Version .*)|(\s*1 file\(s\) copied\.)"
			create a_regexp3.make
			a_regexp3.compile (a_pattern3)
			assert ("cannot compile regexp '" + a_pattern3 + "'", a_regexp3.is_compiled)
			a_regexp3.optimize
			a_pattern4 := "[a-zA-Z0-9_]+\.c"
			create a_regexp4.make
			a_regexp4.compile (a_pattern4)
			assert ("cannot compile regexp '" + a_pattern4 + "'", a_regexp4.is_compiled)
			a_regexp4.optimize
			a_pattern5 := "Batch/Stop mode: saving new configuration format as"
			create a_regexp5.make
			a_regexp5.compile (a_pattern5)
			assert ("cannot compile regexp '" + a_pattern5 + "'", a_regexp5.is_compiled)
			a_regexp5.optimize
			a_pattern6 := "(Eiffel C/C\+\+ Compilation Tool - Version:)|(Copyright Eiffel Software)|(Microsoft \(R\) Incremental Linker Version)|(Microsoft \(R\) Windows \(R\) Resource Compiler Version)|(Copyright \(C\) Microsoft Corporation)|(You must now run \%"finish_freezing(\.exe)?\%" in:)|(Ttest[0-9]+[\\/](\.[\\/])?EIFGENs[\\/]aa[\\/][WF]_code)"
			create a_regexp6.make
			a_regexp6.compile (a_pattern6)
			assert ("cannot compile regexp '" + a_pattern6 + "'", a_regexp6.is_compiled)
			a_regexp6.optimize
			a_pattern7 := "(-STACK:5000000)|(-NODEFAULTLIB:libc)|(-SUBSYSTEM:CONSOLE)|(-OUT:aa\.exe)|(e1\\emain\.obj)|(E1\\estructure\.h)|(wkbench\.lib)|(finalized\.lib)|(USER32\.lib)|(WSOCK32\.lib)|(WSOCK32\.dll)|(ADVAPI32\.lib)|(GDI32\.lib)|(SHELL32\.lib)|(MSIMG32\.lib)|(COMDLG32\.lib)|(UUID\.lib)|(OLE32\.lib)|(OLEAUT32\.lib)|(COMCTL32\.lib)|(MPR\.LIB)|(aa\.res)|(E[0-9]+\\[A-Za-z0-9_]+\.obj)|(E[0-9]+\\[A-Za-z0-9_]+\.lib)|(C[0-9]+\\Cobj[0-9]+\.lib)"
			create a_regexp7.make
			a_regexp7.compile (a_pattern7)
			assert ("cannot compile regexp '" + a_pattern7 + "'", a_regexp7.is_compiled)
			a_regexp7.optimize
			a_pattern8 := "WARNING: Option '[^']+' was found in neither CONFIG\.EIF nor registry\."
			create a_regexp8.make
			a_regexp8.compile (a_pattern8)
			assert ("cannot compile regexp '" + a_pattern8 + "'", a_regexp8.is_compiled)
			a_regexp8.optimize
				-- Copy files.
			create out_file.make (an_output_filename)
			out_file.open_append
			if out_file.is_open_write then
				create in_file.make (an_input_filename)
				in_file.open_read
				if in_file.is_open_read then
					from
						in_file.read_line
					until
						in_file.end_of_file
					loop
						a_line := in_file.last_string
						if a_line.is_empty then
							l_empty_line := True
						elseif a_regexp1.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp2.matches (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp3.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp4.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp5.matches (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp6.matches (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp7.matches (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp8.matches (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						else
							if l_empty_line then
								out_file.put_new_line
								l_empty_line := False
							end
							out_file.put_line (a_line)
						end
						a_regexp1.wipe_out
						a_regexp2.wipe_out
						a_regexp3.wipe_out
						a_regexp4.wipe_out
						a_regexp5.wipe_out
						a_regexp6.wipe_out
						a_regexp7.wipe_out
						a_regexp8.wipe_out
						in_file.read_line
					end
					in_file.close
					if l_empty_line then
						out_file.put_new_line
						l_empty_line := False
					end
				else
					assert ("cannot open file '" + an_input_filename + "'", False)
				end
				out_file.close
			else
				assert ("cannot open file '" + an_output_filename + "'", False)
			end
		end

	concat_output1_ise
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

feature -- Execution

	set_up
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

	tear_down
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

feature {NONE} -- Directory and file names

	program_name: STRING
			-- Program name
		once
			Result := "aa"
		ensure
			program_name_not_void: Result /= Void
			program_name_not_empty: Result.count > 0
		end

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		deferred
		ensure
			rule_dirname_not_void: Result /= Void
			rule_dirname_not_empty: Result.count > 0
		end

	program_dirname (a_test_name: STRING): STRING
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

	program_exe: STRING
			-- Name of program executable filename
		do
			Result := file_system.pathname (file_system.relative_current_directory, program_name + file_system.exe_extension)
		ensure
			program_exe_not_void: Result /= Void
			program_exe_not_empty: Result.count > 0
		end

	geant_filename (a_test_name: STRING): STRING
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

	xace_filename (a_test_name: STRING): STRING
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

	testdir: STRING
			-- Name of temporary directory where to run the test
		deferred
		ensure
			testdir_not_void: Result /= Void
			testdir_not_empty: Result.count > 0
		end

feature {NONE} -- Output logs

	output_log_filename: STRING = "output.log"
			-- Test output log filename

	output1_log_filename: STRING = "output1.log"
			-- Compilation output log filename

	error1_log_filename: STRING = "error1.log"
			-- Compilation error log filename

	output1_log: STRING
			-- Where and how to redirect compilation output logs
		once
			Result := " > " + output1_log_filename + " 2> " + error1_log_filename
		ensure
			output1_log_not_void: Result /= Void
			output1_log_not_empty: Result.count > 0
		end

	output2_log_filename: STRING = "output2.log"
			-- Execution output log filename

	error2_log_filename: STRING = "error2.log"
			-- Execution error log filename

	output2_log: STRING
			-- Where and how to redirect execution output logs
		once
			Result := " > " + output2_log_filename + " 2> " + error2_log_filename
		ensure
			output2_log_not_void: Result /= Void
			output2_log_not_empty: Result.count > 0
		end

	output3_log_filename: STRING = "output3.log"
			-- Cleaning output log filename

	error3_log_filename: STRING = "error3.log"
			-- Cleaning error log filename

	output3_log: STRING
			-- Where and how to redirect cleaning output logs
		once
			Result := " > " + output3_log_filename + " 2> " + error3_log_filename
		ensure
			output3_log_not_void: Result /= Void
			output3_log_not_empty: Result.count > 0
		end

	concat_output1 (a_filter: PROCEDURE [TUPLE [STRING, STRING]])
			-- Concat the logs of the compilation to 'output.log'.
		require
			a_filter_not_void: a_filter /= Void
		do
			file_system.delete_file (output_log_filename)
			a_filter.call ([output1_log_filename, output_log_filename])
			a_filter.call ([error1_log_filename, output_log_filename])
		end

	concat_output2
			-- Concat the logs of the execution to 'output.log'.
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_pattern1: STRING
			a_regexp1: RX_PCRE_REGULAR_EXPRESSION
			l_input_filename: STRING
		do
				-- Compile regexp.
			a_pattern1 := "<[0-9A-F]{16}>(.*)"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
				-- Copy files.
			create out_file.make (output_log_filename)
			out_file.open_append
			if out_file.is_open_write then
				from
					l_input_filename := output2_log_filename
				until
					l_input_filename = Void
				loop
					create in_file.make (l_input_filename)
					in_file.open_read
					if in_file.is_open_read then
						from
							in_file.read_line
						until
							in_file.end_of_file
						loop
							a_line := in_file.last_string
							if a_regexp1.recognizes (a_line) then
									-- These are object addresses in exception traces.
								out_file.put_string ("<XXXXXXXXXXXXXXXX>")
								out_file.put_line (a_regexp1.captured_substring (1))
							else
								out_file.put_line (a_line)
							end
							a_regexp1.wipe_out
							in_file.read_line
						end
						in_file.close
					else
						assert ("cannot open file '" + l_input_filename + "'", False)
					end
					if l_input_filename = output2_log_filename then
						l_input_filename := error2_log_filename
					else
						l_input_filename := Void
					end
				end
				out_file.close
			else
				assert ("cannot open file '" + output_log_filename + "'", False)
			end
		end

	concat_output3
			-- Concat the logs of the cleaning to 'output.log'.
		do
			file_system.concat_files (output_log_filename, output3_log_filename)
			file_system.concat_files (output_log_filename, error3_log_filename)
		end

	output_recognized (a_filename1: STRING; a_directory1: KL_DIRECTORY; a_regexp1: RX_REGULAR_EXPRESSION; a_filename2: STRING): BOOLEAN
			-- Is `a_filename1' of the form expected by `a_regexp1' in `a_directory1',
			-- and then is there no difference between the contents of files named
			-- `a_filename1' and `a_filename2' (after the environment variables in
			-- file `a_filename1' have been expanded)?
		require
			a_filename1_not_void: a_filename1 /= Void
			a_filename1_not_empty: a_filename1.count > 0
			a_directory1_not_void: a_directory1 /= Void
			a_regexp1_not_void: a_regexp1 /= Void
			a_regexp1_compied: a_regexp1.is_compiled
			a_filename2_not_void: a_filename2 /= Void
			a_filename2_not_empty: a_filename2.count > 0
		local
			l_full_filename1: STRING
			l_file1, l_file2: KI_TEXT_INPUT_FILE
			done: BOOLEAN
			l_pattern2: STRING
			l_regexp2: RX_PCRE_REGULAR_EXPRESSION
		do
			if a_regexp1.recognizes (a_filename1) then
					-- Compile regexp.
				l_pattern2 := "^Parse error in "
				create l_regexp2.make
				l_regexp2.compile (l_pattern2)
				assert ("cannot compile regexp '" + l_pattern2 + "'", l_regexp2.is_compiled)
				l_regexp2.optimize
				l_full_filename1 := file_system.pathname (a_directory1.name, a_filename1)
				l_file1 := file_system.new_input_file (l_full_filename1)
				l_file1.open_read
				if l_file1.is_open_read then
					l_file2 := file_system.new_input_file (a_filename2)
					l_file2.open_read
					if l_file2.is_open_read then
						Result := True
						from
						until
							done
						loop
							l_file1.read_line
							l_file2.read_line
							if l_file1.end_of_file then
								if not l_file2.end_of_file then
									Result := False
								end
								l_file1.close
								l_file2.close
								done := True
							elseif l_file2.end_of_file then
								Result := False
								l_file1.close
								l_file2.close
								done := True
							elseif not Execution_environment.interpreted_string (l_file1.last_string).same_string (l_file2.last_string) then
								if not l_regexp2.matches (l_file2.last_string) or else not Execution_environment.interpreted_string (l_file1.last_string).as_lower.same_string (l_file2.last_string.as_lower) then
									Result := False
									l_file1.close
									l_file2.close
									done := True
								end
							end
						end
					else
						l_file1.close
						Result := False
					end
				else
					Result := False
				end
			end
		end

feature {NONE} -- Execution

	execute_shell (a_shell_command: STRING)
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

feature {NONE} -- Regular expressions

	passed_filename_regexp (a_file_extension: STRING): RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression corresponding to names of files containing possible passed output logs
			-- `a_file_extension' is the expected file extension, without the leading dot.
		require
			a_file_extension_not_void: a_file_extension /= Void
			a_file_extension_not_empty: not a_file_extension.is_empty
		do
			create Result.make
			Result.compile (".*passed.*\." + a_file_extension)
		ensure
			passed_regexp_gec_not_void: Result /= Void
			passed_regexp_gec_compiled: Result.is_compiled
		end

	failed_filename_regexp (a_file_extension: STRING): RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression corresponding to names of files containing possible failed output logs;
			-- `a_file_extension' is the expected file extension, without the leading dot.
		require
			a_file_extension_not_void: a_file_extension /= Void
			a_file_extension_not_empty: not a_file_extension.is_empty
		do
			create Result.make
			Result.compile (".*failed.*\." + a_file_extension)
		ensure
			failed_regexp_gec_not_void: Result /= Void
			failed_regexp_gec_compiled: Result.is_compiled
		end

end
