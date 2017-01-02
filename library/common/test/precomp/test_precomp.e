note

	description:

		"Test precompilation of Gobo Library classes"

	library: "Gobo Eiffel Library"
	copyright: "Copyright (c) 2001-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_PRECOMP

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

create

	make_default

feature -- Test

	test_ge
			-- Test precompilation with Gobo Eiffel.
		do
			if eiffel_compiler.is_ge then
				precomp_ge
			end
		end

	test_ise
			-- Test precompilation with ISE Eiffel.
		do
			if eiffel_compiler.is_ise then
				precomp_ise
			end
		end

feature -- Execution

	tear_down
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

	precomp_ge
			-- Test precompilation with Gobo Eiffel.
		do
			old_cwd := file_system.cwd
			file_system.create_directory (testdir)
			assert (testdir + "_exists", file_system.directory_exists (testdir))
			file_system.cd (testdir)
				-- Generate Ace file.
			assert_execute ("gexace --library=ge " + xace_filename + output_log)
				-- Gobo Eiffel Lint.
			assert_execute ("gelint --flat ge.xace" + output_log)
		end

	precomp_ise
			-- Test precompilation with ISE Eiffel.
		local
			define_option: STRING
			dotnet: STRING
			l_compatible: STRING
			l_compat_option: STRING
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
			dotnet := Execution_environment.variable_value ("GOBO_DOTNET")
			if dotnet /= Void and then dotnet.count > 0 then
				if define_option.count = 0 then
					define_option.append_string ("--define=%"GOBO_DOTNET")
				else
					define_option.append_string (" GOBO_DOTNET")
				end
			end
			l_compat_option := ""
			l_compatible := Execution_environment.variable_value ("GOBO_COMPATIBLE")
			if l_compatible /= Void and then l_compatible.count > 0 then
				l_compat_option := " -compat"
				if define_option.count = 0 then
					define_option.append_string ("--define=%"GOBO_COMPATIBLE")
				else
					define_option.append_string (" GOBO_COMPATIBLE")
				end
			end
			if define_option.count > 0 then
				define_option.append_string ("%" ")
			end
			assert_execute ("gexace " + define_option + "--library=ise " + xace_filename + output_log)
				-- Eiffel precompilation.
			assert_execute ("ecb " + l_compat_option + "-precompile -batch -config ise.ecf" + output_log)
				-- Done.
			file_system.cd (old_cwd)
			file_system.recursive_delete_directory (testdir)
		end

feature {NONE} -- Implementation

	xace_filename: STRING
			-- Name of Xace file used for precompilation
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "common", "test", "precomp", "precomp.xace">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			xace_filename_not_void: Result /= Void
			xace_filename_not_empty: Result.count > 0
		end

	testdir: STRING = "Tprecomp"
			-- Name of temporary directory where to launch
			-- the precompilation

	output_log_filename: STRING = "output.log"
			-- Output log filename

	error_log_filename: STRING = "error.log"
			-- Error log filename

	output_log: STRING
			-- Where and how to redirect output logs
		once
			Result := " > " + output_log_filename + " 2> " + error_log_filename
		ensure
			output_log_not_void: Result /= Void
			output_log_not_empty: Result.count > 0
		end

end
