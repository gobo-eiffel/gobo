note

	description:

		"Test 'xslt/schematron' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005-2016, Colin Adams and others"
	license: "MIT License"

class XM_ETEST_SCHEMATRON

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING = "schematron"
			-- Program name

	library_name: STRING = "xslt"
			-- Library name of example

feature -- Test

	test_schematron
			-- Test 'xslt/schematron' example.
		local
			schematron_exe: STRING
		do
			compile_program
				-- Run example.
			schematron_exe := program_exe
			assert_execute (schematron_exe + " --output=report.txt " +  data_filename + " " + schema_filename  + output_log)
			assert_integers_equal ("One error message", 69, file_system.file_count (error_log_filename))
			assert_files_equal ("diff", report_filename, "report.txt")
		end

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "example", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

	data_dirname: STRING
			-- Name of program data directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "example", program_name, "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	schema_filename: STRING
			-- Path for 'wai.xml'
		once
			Result := file_system.pathname (data_dirname, "wai.xml")
		ensure
			schema_filename_not_void: Result /= Void
			schema_filename_not_empty: not Result.is_empty
		end

	data_filename: STRING
			-- Path for 'evil_wai.xml'
		once
			Result := file_system.pathname (data_dirname, "evil_wai.xml")
		ensure
			data_filename_not_void: Result /= Void
			data_filename_not_empty: not Result.is_empty
		end

	report_filename: STRING
			-- Path for 'report.txt'
		once
			Result := file_system.pathname (data_dirname, "report.txt")
		ensure
			report_filename_not_void: Result /= Void
			report_filename_not_empty: not Result.is_empty
		end

end
