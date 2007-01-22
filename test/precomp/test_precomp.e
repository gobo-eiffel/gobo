indexing

	description:

		"Test precompilation of Gobo Library classes"

	library: "Gobo Eiffel Library"
	copyright: "Copyright (c) 2001-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_PRECOMP

inherit

	TS_TEST_CASE
		redefine
			tear_down
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

feature -- Test

	test_ge is
			-- Test precompilation with Gobo Eiffel.
		do
			if eiffel_compiler.is_ge then
				precomp_ge
			end
		end

-- This test does not work anymore with ISE 5.7 because of the
-- introduction of ECF which does not take the 'exclude' clause
-- in the 'base' cluster into account when converting the Ace
-- file to ECF.
	xxtest_ise_base is
			-- Test precompilation with ISE Eiffel using Gobo's
			-- EiffelBase emulation instead of ISE's EiffelBase.
		do
			if eiffel_compiler.is_ise then
				precomp_ise (True)
			end
		end

	test_ise is
			-- Test precompilation with ISE Eiffel.
		do
			if eiffel_compiler.is_ise then
				precomp_ise (False)
			end
		end

	test_ve is
			-- Test precompilation with Visual Eiffel.
		do
			if eiffel_compiler.is_ve then
				precomp_ve
			end
		end

	test_se is
			-- Test precompilation with SmartEiffel.
		do
			if eiffel_compiler.is_se then
				precomp_se
			end
		end

feature -- Execution

	tear_down is
			-- Tear down after a test.
		do
			if old_cwd /= Void then
				file_system.cd (old_cwd)
				old_cwd := Void
			end
		end

	old_cwd: STRING
			-- Initial current working directory

feature {NONE} -- Precompilation

	precomp_ge is
			-- Test precompilation with Gobo Eiffel.
		do
			old_cwd := file_system.cwd
			file_system.create_directory (testdir)
			assert (testdir + "_exists", file_system.directory_exists (testdir))
			file_system.cd (testdir)
				-- Generate Ace file.
			assert_execute ("gexace --library=ge " + xace_filename + output_log)
				-- Gobo Eiffel Lint.
			assert_execute ("gelint --flat ge.ace" + output_log)
		end

	precomp_ise (base: BOOLEAN) is
			-- Test precompilation with ISE Eiffel. If `base' is true then
			-- use Gobo's EiffelBase emulation instead of ISE's EiffelBase.
		local
			define_option: STRING
			dotnet: STRING
			ise_5_6: STRING
		do
			old_cwd := file_system.cwd
			file_system.create_directory (testdir)
			assert (testdir + "_exists", file_system.directory_exists (testdir))
			file_system.cd (testdir)
				-- Make sure that there is not left-over from
				-- previous precompilation.
			assert ("EIFGEN_not_exists", not file_system.directory_exists ("EIFGEN"))
			assert ("EIFGENs_not_exists", not file_system.directory_exists ("EIFGENs"))
				-- Generate Ace file.
			create define_option.make (50)
			if base then
				define_option.append_string ("--define=%"GOBO_EIFFELBASE")
			end
			dotnet := Execution_environment.variable_value ("GOBO_DOTNET")
			if dotnet /= Void and then dotnet.count > 0 then
				if define_option.count = 0 then
					define_option.append_string ("--define=%"GOBO_DOTNET")
				else
					define_option.append_string (" GOBO_DOTNET")
				end
			end
			ise_5_6 := Execution_environment.variable_value ("ISE_5_6")
			if ise_5_6 /= Void and then ise_5_6.count > 0 then
				if define_option.count = 0 then
					define_option.append_string ("--define=%"ISE_5_6")
				else
					define_option.append_string (" ISE_5_6")
				end
			end
			if define_option.count > 0 then
				define_option.append_string ("%" ")
			end
			assert_execute ("gexace " + define_option + "--library=ise " + xace_filename + output_log)
				-- Eiffel precompilation.
			assert_execute ("ec -precompile -batch -ace ise.ace" + output_log)
				-- Done.
			file_system.cd (old_cwd)
			file_system.recursive_delete_directory (testdir)
		end

	precomp_ve is
			-- Test precompilation with Visual Eiffel.
		do
			old_cwd := file_system.cwd
			file_system.create_directory (testdir)
			assert (testdir + "_exists", file_system.directory_exists (testdir))
			file_system.cd (testdir)
				-- Generate Xace file.
			assert_execute ("gexace --library=ve " + xace_filename + output_log)
				-- Eiffel precompilation.
			assert_execute ("vec -no -p:ve.xace" + output_log)
			assert ("no_output", not file_system.file_exists ("Result.out"))
				-- Done.
			assert_execute ("vec -no -dc -y" + output_log)
		end

	precomp_se is
			-- Test precompilation with SmartEiffel.
		local
			a_file: KL_TEXT_INPUT_FILE
			a_line: STRING
			a_dir: KL_DIRECTORY
			a_dirname, a_filename: STRING
		do
			old_cwd := file_system.cwd
			file_system.create_directory (testdir)
			assert (testdir + "_exists", file_system.directory_exists (testdir))
			file_system.cd (testdir)
				-- Generate loadpath file.
			assert_execute ("gexace --library=se " + xace_filename + output_log)
				-- Eiffel precompilation.
			create a_file.make ("loadpath.se")
			a_file.open_read
			if a_file.is_open_read then
				from
					a_file.read_line
				until
					a_file.end_of_file
				loop
					a_line := a_file.last_string
					if a_line.has_substring ("GOBO") then
						a_dirname := file_system.pathname_from_file_system (a_line, unix_file_system)
						a_dirname := Execution_environment.interpreted_string (a_dirname)
						create a_dir.make (a_dirname)
						a_dir.open_read
						if a_dir.is_open_read then
							from
								a_dir.read_entry
							until
								a_dir.end_of_input
							loop
								a_filename := a_dir.last_entry
								if file_system.has_extension (a_filename, ".e") then
									a_filename := file_system.pathname (a_dirname, a_filename)
									assert_execute ("short -plain -no_style_warning -no_warning " + a_filename + output_log)
									if file_system.file_count (error_log_filename) /= 0 then
										assert_files_equal ("error_log_diff", se_warning_filename, error_log_filename)
									end
								end
								a_dir.read_entry
							end
							a_dir.close
						else
							assert (a_dirname + "_open_read", False)
						end
					end
					a_file.read_line
				end
				a_file.close
			else
				assert ("open_read1", False)
			end
		end

feature {NONE} -- Implementation

	xace_filename: STRING is
			-- Name of Xace file used for precompilation
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "precomp", "precomp.xace">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			xace_filename_not_void: Result /= Void
			xace_filename_not_empty: Result.count > 0
		end

	se_warning_filename: STRING is
			-- Name of file containing SE 1.2 warning
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "common", "data", "sewarning.txt">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			se_warning_filename_not_void: Result /= Void
			se_warning_filename_not_empty: Result.count > 0
		end

	testdir: STRING is "Tprecomp"
			-- Name of temporary directory where to launch
			-- the precompilation

	output_log_filename: STRING is "output.log"
			-- Output log filename

	error_log_filename: STRING is "error.log"
			-- Error log filename

	output_log: STRING is
			-- Where and how to redirect output logs
		once
			Result := " > " + output_log_filename + " 2> " + error_log_filename
		ensure
			output_log_not_void: Result /= Void
			output_log_not_empty: Result.count > 0
		end

end
