indexing

	description:

		"Example test cases"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class EXAMPLE_TEST_CASE

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

	example: STRING is
			-- Example name
		deferred
		ensure
			example_not_void: Result /= Void
			example_not_empty: Result.count > 0
		end

	library: STRING is
			-- Library name of example
		deferred
		ensure
			library_not_void: Result /= Void
			library_not_empty: Result.count > 0
		end

feature -- Test

	compile_example is
			-- Compile example.
		local
			a_debug: STRING
			a_geant_filename: STRING
		do
				-- Compile tool.
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
			assert ("exe_exists", file_system.file_exists (example_exe))
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

	example_dirname: STRING is
			-- Name of example source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library, example>>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			example_dirname_not_void: Result /= Void
			example_dirname_not_empty: Result.count > 0
		end

	example_exe: STRING is
			-- Name of example executable filename
		do
			Result := example + file_system.exe_extension
		ensure
			tool_exe_not_void: Result /= Void
			tool_exe_not_empty: Result.count > 0
		end

	geant_filename: STRING is
			-- Name of geant build file used for compilation
		do
			Result := file_system.pathname (example_dirname, "build.eant")
		ensure
			geant_filename_not_void: Result /= Void
			geant_filename_not_empty: Result.count > 0
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "T" + example
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

end -- class EXAMPLE_TEST_CASE
