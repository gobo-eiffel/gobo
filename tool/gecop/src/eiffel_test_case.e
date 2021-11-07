note

	description:

		"Eiffel standard test cases"

	copyright: "Copyright (c) 2002-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class EIFFEL_TEST_CASE

inherit

	TS_TEST_CASE
		redefine
			make_default,
			set_up
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	make,
	make_default

feature {NONE} -- Initialization

	make (a_program_dirname, a_test_dirname: STRING)
			-- Create a new test case with program `a_program_dirname'
			-- to be compiled and run in `a_test_dirname'.
		require
			a_program_dirname_not_void: a_program_dirname /= Void
			a_program_dirname_not_empty: not a_program_dirname.is_empty
			a_test_dirname_not_void: a_test_dirname /= Void
			a_test_dirname_not_empty: not a_test_dirname.is_empty
		do
			make_default
			program_dirname := a_program_dirname
			testrun_dirname := a_test_dirname
		ensure
			program_dirname_set: program_dirname = a_program_dirname
			testrun_dirname_set: testrun_dirname = a_test_dirname
		end

	make_default
			-- <Precursor>
		do
			program_dirname := default_testrun_dirname
			testrun_dirname := default_testrun_dirname
			precursor
		end

feature -- Test

	compile_and_test (a_tested_eiffel_tool: STRING)
			-- Compile and test with `a_tested_eiffel_tool'.
		require
			a_tested_eiffel_tool_not_void: a_tested_eiffel_tool /= Void
		do
			if a_tested_eiffel_tool.same_string ("ise") then
				compile_and_test_ise
			elseif a_tested_eiffel_tool.same_string ("ise_debug") then
				variables.set_value ("debug", "true")
				compile_and_test_ise
			elseif a_tested_eiffel_tool.same_string ("ise_dotnet") then
				variables.set_value ("GOBO_DOTNET", "true")
				compile_and_test_ise
			elseif a_tested_eiffel_tool.same_string ("ise_dotnet_debug") then
				variables.set_value ("GOBO_DOTNET", "true")
				variables.set_value ("debug", "true")
				compile_and_test_ise
			elseif a_tested_eiffel_tool.same_string ("ge") then
				compile_and_test_gec
			elseif a_tested_eiffel_tool.same_string ("ge_debug") then
				variables.set_value ("debug", "true")
				compile_and_test_gec
			elseif a_tested_eiffel_tool.same_string ("ge_lint") then
				compile_and_test_gelint
			elseif a_tested_eiffel_tool.same_string ("gec") then
				compile_and_test_gec
			elseif a_tested_eiffel_tool.same_string ("gelint") then
				compile_and_test_gelint
			else
				assert ("unknown eiffel tool: " + a_tested_eiffel_tool, False)
			end
		end

feature -- Test Gobo Eiffel Compiler

	compile_and_test_gec
			-- Compile and test with gec.
		local
			a_debug: STRING
			a_geant_filename: STRING
			l_directory: KL_DIRECTORY
			l_executable: STRING
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			if variables.has ("executable") then
				l_executable := " -D%"GEC_EXECUTABLE=" + variables.value ("executable") + "%""
			else
				l_executable := ""
			end
			a_geant_filename := geant_filename
				-- Compile program.
			execute_shell ("geant -b %"" + a_geant_filename + "%"" + l_executable + " -Dgelint_option=true compile_" + a_debug + "ge" + output1_log)
			concat_output1 (agent filter_output_gec)
				-- Execute program.
			if file_system.file_exists (file_system.pathname (testrun_dirname, program_exe)) then
				execute_shell (program_exe + output2_log)
				concat_output2
			end
				-- Clean.
			execute_shell ("geant -b %"" + a_geant_filename + "%" clobber" + output3_log)
			concat_output3
				-- Test.
			create l_directory.make (program_dirname)
			if l_directory.there_exists (agent output_recognized (?, l_directory, passed_filename_regexp ("gec?"), output_log_filename)) then
				assert ("test_passed", True)
			elseif l_directory.there_exists (agent output_recognized (?, l_directory, failed_filename_regexp ("gec?"), output_log_filename)) then
				assert ("test_failed", False)
			else
				assert_known_test_result ("unknown_test_result", False, output_log_filename)
			end
		end

feature {NONE} -- Test Gobo Eiffel Compiler

	filter_output_gec (an_input_filename, an_output_filename: STRING)
			-- Filter text from file `an_input_filename' and append it to the end of file `an_output_filename'.
		require
			an_input_filename_not_void: an_input_filename /= Void
			an_output_filename_not_void: an_output_filename /= Void
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_pattern1, a_pattern2, a_pattern3, a_pattern4: STRING
			a_regexp1, a_regexp2, a_regexp3, a_regexp4: RX_PCRE_REGULAR_EXPRESSION
			l_empty_line: BOOLEAN
			l_first_line: BOOLEAN
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
			a_pattern3 := "(Degree -?[0-9]+|Total Time): [ 0-9:./]*"
			create a_regexp3.make
			a_regexp3.compile (a_pattern3)
			assert ("cannot compile regexp '" + a_pattern3 + "'", a_regexp3.is_compiled)
			a_regexp3.optimize
			a_pattern4 := "(line [0-9]+ column [0-9]+ in )([^\\/]*[\\/])*([a-z][a-z0-9_]*\.e)"
			create a_regexp4.make
			a_regexp4.compile (a_pattern4)
			assert ("cannot compile regexp '" + a_pattern4 + "'", a_regexp4.is_compiled)
			a_regexp4.optimize
				-- Copy files.
			create out_file.make (an_output_filename)
			out_file.open_append
			if out_file.is_open_write then
				create in_file.make (an_input_filename)
				in_file.open_read
				if in_file.is_open_read then
					from
						in_file.read_line
						l_first_line := True
					until
						in_file.end_of_file
					loop
						a_line := in_file.last_string
						if l_first_line and then a_line.starts_with ({UC_UTF8_ROUTINES}.utf8_bom) then
							a_line := a_line.tail (a_line.count - {UC_UTF8_ROUTINES}.utf8_bom.count)
						end
						if a_line.is_empty then
							l_empty_line := True
						elseif a_regexp1.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp2.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						elseif a_regexp3.recognizes (a_line) then
								-- Skip this line and the previous empty line.
							l_empty_line := False
						else
							if l_empty_line then
								out_file.put_new_line
								l_empty_line := False
							end
							if a_regexp4.recognizes (a_line) then
								out_file.put_line (a_regexp4.captured_substring (1) + a_regexp4.captured_substring (3))
							else
								out_file.put_line (a_line)
							end
						end
						a_regexp1.wipe_out
						a_regexp2.wipe_out
						a_regexp3.wipe_out
						a_regexp4.wipe_out
						in_file.read_line
						l_first_line := False
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

feature -- Test gelint

	compile_and_test_gelint
			-- Compile and test with gelint.
		local
			a_debug: STRING
			l_directory: KL_DIRECTORY
			l_executable: STRING
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			if variables.has ("executable") then
				l_executable := variables.value ("executable")
			else
				l_executable := "gelint"
			end
			execute_shell (l_executable + " --variable=GOBO_EIFFEL=ge --flat %"" + ecf_filename + "%"" + output1_log)
			concat_output1 (agent filter_output_gelint)
				-- Test.
			create l_directory.make (program_dirname)
			if l_directory.there_exists (agent output_recognized (?, l_directory, passed_filename_regexp ("(gelint|gec?)"), output_log_filename)) then
				assert ("test_passed", True)
			elseif l_directory.there_exists (agent output_recognized (?, l_directory, failed_filename_regexp ("(gelint|gec?)"), output_log_filename)) then
				assert ("test_failed", False)
			else
				assert_known_test_result ("unknown_test_result", False, output_log_filename)
			end
		end

feature {NONE} -- Test gelint

	filter_output_gelint (an_input_filename, an_output_filename: STRING)
			-- Filter text from file `an_input_filename' and append it to the end of file `an_output_filename'.
		require
			an_input_filename_not_void: an_input_filename /= Void
			an_output_filename_not_void: an_output_filename /= Void
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_pattern1, a_pattern2, a_pattern3: STRING
			a_regexp1, a_regexp2, a_regexp3: RX_PCRE_REGULAR_EXPRESSION
			l_empty_line: BOOLEAN
			l_first_line: BOOLEAN
		do
				-- Compile regexps.
			a_pattern1 := "BUILD FAILED!"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
			a_pattern2 := "(Degree -?[0-9]+|Total Time): [ 0-9:./]*"
			create a_regexp2.make
			a_regexp2.compile (a_pattern2)
			assert ("cannot compile regexp '" + a_pattern2 + "'", a_regexp2.is_compiled)
			a_regexp2.optimize
			a_pattern3 := "(line [0-9]+ column [0-9]+ in )([^\\/]*[\\/])*([a-z][a-z0-9_]*\.e)"
			create a_regexp3.make
			a_regexp3.compile (a_pattern3)
			assert ("cannot compile regexp '" + a_pattern3 + "'", a_regexp3.is_compiled)
			a_regexp3.optimize
				-- Copy files.
			create out_file.make (an_output_filename)
			out_file.open_append
			if out_file.is_open_write then
				create in_file.make (an_input_filename)
				in_file.open_read
				if in_file.is_open_read then
					from
						in_file.read_line
						l_first_line := True
					until
						in_file.end_of_file
					loop
						a_line := in_file.last_string
						if l_first_line and then a_line.starts_with ({UC_UTF8_ROUTINES}.utf8_bom) then
							a_line := a_line.tail (a_line.count - {UC_UTF8_ROUTINES}.utf8_bom.count)
						end
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
							if a_regexp3.recognizes (a_line) then
								out_file.put_line (a_regexp3.captured_substring (1) + a_regexp3.captured_substring (3))
							else
								out_file.put_line (a_line)
							end
						end
						a_regexp1.wipe_out
						a_regexp2.wipe_out
						a_regexp3.wipe_out
						in_file.read_line
						l_first_line := False
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

feature -- Test ISE Eiffel

	compile_and_test_ise
			-- Compile and test with ISE Eiffel.
		local
			a_debug: STRING
			l_dotnet: STRING
			a_geant_filename: STRING
			l_directory: KL_DIRECTORY
			l_executable: STRING
		do
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			if variables.has ("executable") then
				l_executable := " -D%"EC_EXECUTABLE=" + variables.value ("executable") + "%""
			else
					-- Use 'ecb' by default to run the validation suite.
					-- It runs faster. The generated EIFGEN is not compatible with 'ec',
					-- but this is not a problem here since we remove the EIFGEN at the
					-- end of this test.
				l_executable := " -DEC_EXECUTABLE=ecb"
			end
			if variables.has ("GOBO_DOTNET") or attached Execution_environment.variable_value ("GOBO_DOTNET") as l_variable and then not l_variable.is_empty then
				l_dotnet := " -DGOBO_DOTNET=true"
			else
				l_dotnet := ""
			end
			a_geant_filename := geant_filename
				-- Compile program.
			execute_shell ("geant -b %"" + a_geant_filename + "%"" + l_executable + l_dotnet + " compile_" + a_debug + "ise" + output1_log)
			concat_output1 (agent filter_output_ise)
				-- Execute program.
			if file_system.file_exists (file_system.pathname (testrun_dirname, program_exe)) then
				execute_shell (program_exe + output2_log)
				concat_output2
			end
				-- Clean.
			execute_shell ("geant -b %"" + a_geant_filename + "%" clobber" + output3_log)
			concat_output3
				-- Test.
			create l_directory.make (program_dirname)
			if l_directory.there_exists (agent output_recognized (?, l_directory, passed_filename_regexp ("ise"), output_log_filename)) then
				assert ("test_passed", True)
			elseif l_directory.there_exists (agent output_recognized (?, l_directory, failed_filename_regexp ("ise"), output_log_filename)) then
				assert ("test_failed", False)
			else
				assert_known_test_result ("unknown_test_result", False, output_log_filename)
			end
		end

feature {NONE} -- Test ISE Eiffel

	filter_output_ise (an_input_filename, an_output_filename: STRING)
			-- Filter text from file `an_input_filename' and append it to the end of file `an_output_filename'.
		require
			an_input_filename_not_void: an_input_filename /= Void
			an_output_filename_not_void: an_output_filename /= Void
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_pattern1, a_pattern2, a_pattern3, a_pattern4, a_pattern5, a_pattern6, a_pattern7, a_pattern8, a_pattern9, a_pattern10: STRING
			a_regexp1, a_regexp2, a_regexp3, a_regexp4, a_regexp5, a_regexp6, a_regexp7, a_regexp8, a_regexp9, a_regexp10: RX_PCRE_REGULAR_EXPRESSION
			l_empty_line: BOOLEAN
			l_first_line: BOOLEAN
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
			a_pattern6 := "(Eiffel C/C\+\+ Compilation Tool - Version:)|(Copyright Eiffel Software)|(Microsoft \(R\) Incremental Linker Version)|(Microsoft \(R\) Windows \(R\) Resource Compiler Version)|(Copyright \(C\) Microsoft Corporation)|(You must now run \%"finish_freezing(\.exe)?\%" in:)|(EIFGENs[\\/]aa[\\/][WF]_code)"
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
			a_pattern9 := "<[0-9A-F]{16}>(.*)"
			create a_regexp9.make
			a_regexp9.compile (a_pattern9)
			assert ("cannot compile regexp '" + a_pattern9 + "'", a_regexp9.is_compiled)
			a_regexp9.optimize
			a_pattern10 := "(.*([^-]|[^-]-)) @[0-9]+ *"
			create a_regexp10.make
			a_regexp10.compile (a_pattern10)
			assert ("cannot compile regexp '" + a_pattern10 + "'", a_regexp10.is_compiled)
			a_regexp10.optimize
				-- Copy files.
			create out_file.make (an_output_filename)
			out_file.open_append
			if out_file.is_open_write then
				create in_file.make (an_input_filename)
				in_file.open_read
				if in_file.is_open_read then
					from
						in_file.read_line
						l_first_line := True
					until
						in_file.end_of_file
					loop
						a_line := in_file.last_string
						if l_first_line and then a_line.starts_with ({UC_UTF8_ROUTINES}.utf8_bom) then
							a_line := a_line.tail (a_line.count - {UC_UTF8_ROUTINES}.utf8_bom.count)
						end
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
							if a_regexp9.recognizes (a_line) then
									-- These are object addresses in exception traces.
								out_file.put_string ("<XXXXXXXXXXXXXXXX>")
								out_file.put_line (a_regexp9.captured_substring (1))
							elseif a_regexp10.recognizes (a_line) then
									-- These are breakpoint positions in exception traces.
								out_file.put_string (a_regexp10.captured_substring (1))
								out_file.put_line (" @N")
							else
								out_file.put_line (a_line)
							end
						end
						a_regexp1.wipe_out
						a_regexp2.wipe_out
						a_regexp3.wipe_out
						a_regexp4.wipe_out
						a_regexp5.wipe_out
						a_regexp6.wipe_out
						a_regexp7.wipe_out
						a_regexp8.wipe_out
						a_regexp9.wipe_out
						a_regexp10.wipe_out
						in_file.read_line
						l_first_line := False
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
			l_first_line: BOOLEAN
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
							l_first_line := True
						until
							done or
							in_file.end_of_file
						loop
							a_line := in_file.last_string
							if l_first_line and then a_line.starts_with ({UC_UTF8_ROUTINES}.utf8_bom) then
								a_line := a_line.tail (a_line.count - {UC_UTF8_ROUTINES}.utf8_bom.count)
							end
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
							l_first_line := False
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
			if attached set_up_mutex as l_mutex then
				l_mutex.lock
			end
			a_testdir := testrun_dirname
			file_system.recursive_create_directory (a_testdir)
			assert (a_testdir + "_exists", file_system.directory_exists (a_testdir))
			if attached set_up_mutex as l_mutex then
				l_mutex.unlock
			end
		end

feature -- Multi-threading

	set_up_mutex: detachable MUTEX
			-- Mutex to create directories in `set_up'

	set_set_up_mutex (a_mutex: like set_up_mutex)
			-- Set `set_up_mutex' to `a_mutex'.
		do
			set_up_mutex := a_mutex
		ensure
			set_up_mutex_set: set_up_mutex = a_mutex
		end

feature {NONE} -- Directory and file names

	program_name: STRING
			-- Program name
		once
			Result := "aa"
		ensure
			program_name_not_void: Result /= Void
			program_name_not_empty: Result.count > 0
		end

	program_dirname: STRING
			-- Name of program source directory

	program_exe: STRING
			-- Name of program executable file
		do
			Result := file_system.pathname (file_system.relative_current_directory, program_name + file_system.exe_extension)
		ensure
			program_exe_not_void: Result /= Void
			program_exe_not_empty: Result.count > 0
		end

	geant_filename: STRING
			-- Name of geant build file used for compilation
		do
			Result := file_system.pathname (program_dirname, "build.eant")
		ensure
			geant_filename_not_void: Result /= Void
			geant_filename_not_empty: Result.count > 0
		end

	ecf_filename: STRING
			-- Name of ECF file used for compilation
		do
			Result := file_system.pathname (program_dirname, "system.ecf")
		ensure
			ecf_filename_not_void: Result /= Void
			ecf_filename_not_empty: Result.count > 0
		end

	testrun_dirname: STRING
			-- Name of temporary directory where to run the test

feature {NONE} -- Assertions

	assert_known_test_result (a_tag: STRING; a_is_known: BOOLEAN; a_output_filename: STRING)
			-- Assert that the test result is known.
			-- `a_is_known' is True when the test result is known.
			-- `a_output_filename' is the name of the file containing the output of the test.
		require
			a_tag_not_void: a_tag /= Void
			a_output_filename_not_void: a_output_filename /= Void
		local
			l_file: KL_TEXT_INPUT_FILE
			l_output: STRING
		do
			assertions.add_assertion
			if not a_is_known then
				create l_output.make (512)
				l_output.append_string (a_tag)
				l_output.append_string ("%Ntest output:%N----%N")
				create l_file.make (a_output_filename)
				l_file.open_read
				if l_file.is_open_read then
					from
						l_file.read_line
					until
						l_file.end_of_file
					loop
						l_output.append_string (l_file.last_string)
						l_output.append_character ('%N')
						l_file.read_line
					end
					l_file.close
				else
					l_output.append_string ("Cannot read test output file '")
					l_output.append_string (a_output_filename)
					l_output.append_string ("%'%N")
				end
				l_output.append_string ("----")
				logger.report_failure (a_tag, l_output)
				assertions.report_error (l_output)
			else
				logger.report_success (a_tag)
			end
		end

feature {NONE} -- Output logs

	output_log_filename: STRING
			-- Test output log filename
		do
			Result := file_system.pathname (testrun_dirname, "output.log")
		ensure
			output_log_filename_not_void: Result /= Void
			output_log_filename_not_empty: Result.count > 0
		end

	output1_log_basename: STRING = "output1.log"
			-- Compilation output log basename

	output1_log_filename: STRING
			-- Compilation output log filename
		do
			Result := file_system.pathname (testrun_dirname, output1_log_basename)
		ensure
			output1_log_filename_not_void: Result /= Void
			output1_log_filename_not_empty: Result.count > 0
		end

	error1_log_basename: STRING = "error1.log"
			-- Compilation error log basename

	error1_log_filename: STRING
			-- Compilation error log filename
		do
			Result := file_system.pathname (testrun_dirname, error1_log_basename)
		ensure
			error1_log_filename_not_void: Result /= Void
			error1_log_filename_not_empty: Result.count > 0
		end

	output1_log: STRING
			-- Where and how to redirect compilation output logs
		once
			Result := " > " + output1_log_basename + " 2> " + error1_log_basename
		ensure
			output1_log_not_void: Result /= Void
			output1_log_not_empty: Result.count > 0
		end

	output2_log_basename: STRING = "output2.log"
			-- Execution output log basename

	output2_log_filename: STRING
			-- Execution output log filename
		do
			Result := file_system.pathname (testrun_dirname, output2_log_basename)
		ensure
			output2_log_filename_not_void: Result /= Void
			output2_log_filename_not_empty: Result.count > 0
		end

	error2_log_basename: STRING = "error2.log"
			-- Execution error log basename

	error2_log_filename: STRING
			-- Execution error log filename
		do
			Result := file_system.pathname (testrun_dirname, error2_log_basename)
		ensure
			error2_log_filename_not_void: Result /= Void
			error2_log_filename_not_empty: Result.count > 0
		end

	output2_log: STRING
			-- Where and how to redirect execution output logs
		once
			Result := " > " + output2_log_basename + " 2> " + error2_log_basename
		ensure
			output2_log_not_void: Result /= Void
			output2_log_not_empty: Result.count > 0
		end

	output3_log_basename: STRING = "output3.log"
			-- Cleaning output log basename

	output3_log_filename: STRING
			-- Cleaning output log filename
		do
			Result := file_system.pathname (testrun_dirname, output3_log_basename)
		ensure
			output3_log_filename_not_void: Result /= Void
			output3_log_filename_not_empty: Result.count > 0
		end

	error3_log_basename: STRING = "error3.log"
			-- Cleaning error log basename

	error3_log_filename: STRING
			-- Cleaning error log filename
		do
			Result := file_system.pathname (testrun_dirname, error3_log_basename)
		ensure
			error3_log_filename_not_void: Result /= Void
			error3_log_filename_not_empty: Result.count > 0
		end

	output3_log: STRING
			-- Where and how to redirect cleaning output logs
		once
			Result := " > " + output3_log_basename + " 2> " + error3_log_basename
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
			a_pattern1, a_pattern2: STRING
			a_regexp1, a_regexp2: RX_PCRE_REGULAR_EXPRESSION
			l_input_filename: STRING
			l_output2_log_filename: STRING
			l_first_line: BOOLEAN
		do
				-- Compile regexps.
			a_pattern1 := "<[0-9A-F]{16}>(.*)"
			create a_regexp1.make
			a_regexp1.compile (a_pattern1)
			assert ("cannot compile regexp '" + a_pattern1 + "'", a_regexp1.is_compiled)
			a_regexp1.optimize
			a_pattern2 := "(.*([^-]|[^-]-)) @[0-9]+ *"
			create a_regexp2.make
			a_regexp2.compile (a_pattern2)
			assert ("cannot compile regexp '" + a_pattern2 + "'", a_regexp2.is_compiled)
			a_regexp2.optimize
				-- Copy files.
			create out_file.make (output_log_filename)
			out_file.open_append
			if out_file.is_open_write then
				from
					l_output2_log_filename := output2_log_filename
					l_input_filename := l_output2_log_filename
				until
					l_input_filename = Void
				loop
					create in_file.make (l_input_filename)
					in_file.open_read
					if in_file.is_open_read then
						from
							in_file.read_line
							l_first_line := True
						until
							in_file.end_of_file
						loop
							a_line := in_file.last_string
							if l_first_line and then a_line.starts_with ({UC_UTF8_ROUTINES}.utf8_bom) then
								a_line := a_line.tail (a_line.count - {UC_UTF8_ROUTINES}.utf8_bom.count)
							end
							if a_regexp1.recognizes (a_line) then
									-- These are object addresses in exception traces.
								out_file.put_string ("<XXXXXXXXXXXXXXXX>")
								out_file.put_line (a_regexp1.captured_substring (1))
							elseif a_regexp2.recognizes (a_line) then
									-- These are breakpoint positions in exception traces.
								out_file.put_string (a_regexp2.captured_substring (1))
								out_file.put_line (" @N")
							else
								out_file.put_line (a_line)
							end
							a_regexp1.wipe_out
							a_regexp2.wipe_out
							in_file.read_line
							l_first_line := False
						end
						in_file.close
					else
						assert ("cannot open file '" + l_input_filename + "'", False)
					end
					if l_input_filename = l_output2_log_filename then
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
		local
			out_file: KL_TEXT_OUTPUT_FILE
			in_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			l_input_filename: STRING
			l_output3_log_filename: STRING
			l_first_line: BOOLEAN
		do
				-- Copy files.
			create out_file.make (output_log_filename)
			out_file.open_append
			if out_file.is_open_write then
				from
					l_output3_log_filename := output3_log_filename
					l_input_filename := l_output3_log_filename
				until
					l_input_filename = Void
				loop
					create in_file.make (l_input_filename)
					in_file.open_read
					if in_file.is_open_read then
						from
							in_file.read_line
							l_first_line := True
						until
							in_file.end_of_file
						loop
							a_line := in_file.last_string
							if l_first_line and then a_line.starts_with ({UC_UTF8_ROUTINES}.utf8_bom) then
								a_line := a_line.tail (a_line.count - {UC_UTF8_ROUTINES}.utf8_bom.count)
							end
							out_file.put_line (a_line)
							in_file.read_line
							l_first_line := False
						end
						in_file.close
					else
						assert ("cannot open file '" + l_input_filename + "'", False)
					end
					if l_input_filename = l_output3_log_filename then
						l_input_filename := error3_log_filename
					else
						l_input_filename := Void
					end
				end
				out_file.close
			else
				assert ("cannot open file '" + output_log_filename + "'", False)
			end
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
			l_first_line: BOOLEAN
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
							l_first_line := True
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
							elseif l_file1.last_string.same_string (l_file2.last_string) then
								-- OK
							elseif l_first_line and then l_file1.last_string.same_string ({UC_UTF8_ROUTINES}.utf8_bom + l_file2.last_string) then
								-- OK
							elseif l_first_line and then l_file2.last_string.same_string ({UC_UTF8_ROUTINES}.utf8_bom + l_file1.last_string) then
								-- OK
							elseif Execution_environment.interpreted_string (l_file1.last_string).same_string (l_file2.last_string) then
								-- OK
							elseif
								l_regexp2.matches (l_file2.last_string) and then
								(l_file1.last_string.as_lower.same_string (l_file2.last_string.as_lower) or
								Execution_environment.interpreted_string (l_file1.last_string).as_lower.same_string (l_file2.last_string.as_lower))
							then
								-- OK
							else
								Result := False
								l_file1.close
								l_file2.close
								done := True
							end
							l_first_line := False
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
			l_command: DP_SHELL_COMMAND
			l_command_name: STRING
		do
			l_command_name := a_shell_command.twin
			l_command_name.replace_substring_all ("\", "\\")
			l_command_name.replace_substring_all ("%"", "\%"")
			l_command_name := "geant -b %"" + execution_buildname + "%" -Dexecutable=%"" + l_command_name + "%" -Ddirectory=%"" + testrun_dirname + "%" execute"

			create l_command.make (l_command_name)
			l_command.execute
		end

	execution_buildname: STRING
			-- Name of geant build file used for execution
		do
			Result := file_system.nested_pathname (Execution_environment.interpreted_string ("${GOBO}"), <<"library", "common", "config", "execute.eant">>)
		ensure
			execution_buildname_not_void: Result /= Void
			execution_buildname_not_empty: Result.count > 0
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
			passed_filename_regexp_not_void: Result /= Void
			passed_filename_regexp_compiled: Result.is_compiled
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
			failed_filename_regexp_not_void: Result /= Void
			failed_filename_regexp_compiled: Result.is_compiled
		end

feature {NONE} -- Constants

	default_testrun_dirname: STRING = "test1"
			-- Default value for `testrun_dirname'

invariant

	program_dirname_not_void: program_dirname /= Void
	program_dirname_not_empty: not program_dirname.is_empty
	testrun_dirname_not_void: testrun_dirname /= Void
	testrun_dirname_not_empty: not testrun_dirname.is_empty

end
