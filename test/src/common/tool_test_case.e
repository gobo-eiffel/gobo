indexing

	description:

		"Tools test cases"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TOOL_TEST_CASE

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

	tool: STRING is
			-- Tool name
		deferred
		ensure
			tool_not_void: Result /= Void
			tool_not_empty: Result.count > 0
		end

feature -- Test

	compile_tool is
			-- Compile tool.
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
			assert ("tool_exists", file_system.file_exists (tool_exe))
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

	tool_dirname: STRING is
			-- Name of tool source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"src", tool>>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			tool_dirname_not_void: Result /= Void
			tool_dirname_not_empty: Result.count > 0
		end

	tool_exe: STRING is
			-- Name of tool executable filename
		do
			Result := file_system.pathname (file_system.relative_current_directory, tool + file_system.exe_extension)
		ensure
			tool_exe_not_void: Result /= Void
			tool_exe_not_empty: Result.count > 0
		end

	geant_filename: STRING is
			-- Name of geant build file used for compilation
		do
			Result := file_system.pathname (tool_dirname, "build.eant")
		ensure
			geant_filename_not_void: Result /= Void
			geant_filename_not_empty: Result.count > 0
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "T" + tool
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

end
