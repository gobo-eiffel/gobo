note

	description:

		"Program test cases"

	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class PROGRAM_TEST_CASE

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

feature -- Access

	program_name: STRING is
			-- Program name
		deferred
		ensure
			program_name_not_void: Result /= Void
			program_name_not_empty: Result.count > 0
		end

feature -- Test

	compile_program is
			-- Compile program.
		local
			a_debug: STRING
			a_geant_filename: STRING
		do
				-- Compile program.
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename
			assert_execute ("geant -b " + a_geant_filename + " compile_" + a_debug + eiffel_compiler.vendor + output_log)
				-- Clean.
			assert_execute ("geant -b " + a_geant_filename + " clean" + output_log)
				-- Check compilation.
			assert ("program_exists", file_system.file_exists (program_exe))
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

	program_dirname: STRING is
			-- Name of program source directory
		deferred
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

	geant_filename: STRING is
			-- Name of geant build file used for compilation
		do
			Result := file_system.pathname (program_dirname, "build.eant")
		ensure
			geant_filename_not_void: Result /= Void
			geant_filename_not_empty: Result.count > 0
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "T" + program_name
		ensure
			testdir_not_void: Result /= Void
			testdir_not_empty: Result.count > 0
		end

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

	freeise_log_filename: STRING is
			-- Name of file containing message displayed
			-- by programs compiled with the free version
			-- of ISE Eiffel under Linux/Unix
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "common", "data", "freeise.txt">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			freeise_log_filename_not_void: Result /= Void
			freeise_log_filename_not_empty: Result.count > 0
		end

	geeraise_log_filename: STRING is
			-- Name of file containing message displayed
			-- by programs compiled with Gobo Eiffel Compiler
			-- when raising an exception
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "common", "data", "geeraise.txt">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			geeraise_log_filename_not_void: Result /= Void
			geeraise_log_filename_not_empty: Result.count > 0
		end

end
