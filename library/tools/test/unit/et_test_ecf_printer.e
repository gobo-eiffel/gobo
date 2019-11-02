note

	description:

		"Test features of class ET_ECF_PRINTER"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TEST_ECF_PRINTER

inherit

	TS_TEST_CASE
		redefine
			set_up, tear_down
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	make_default

feature -- Test

	test_printer
			-- Test ECF printer.
		local
			l_ecf_parser: ET_ECF_CONFIG_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
			l_printer: ET_ECF_PRINTER
			l_ecf_config: ET_ECF_CONFIG
			l_input_file: KL_TEXT_INPUT_FILE
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			create l_ecf_error_handler.make_standard
			create l_ecf_parser.make (l_ecf_error_handler)
			create l_input_file.make (input_filename)
			l_input_file.open_read
			assert ("is_open_read", l_input_file.is_open_read)
			l_ecf_parser.parse_file (l_input_file)
			l_input_file.close
			l_ecf_config := l_ecf_parser.last_config
			assert ("no_ecf_error", not l_ecf_error_handler.has_error)
			assert ("ecf_system_config_not_void", l_ecf_config /= Void)
			check asserted_above: l_ecf_config /= Void then end
			create l_output_file.make ("gobo.txt")
			l_output_file.open_write
			assert ("is_open_write", l_output_file.is_open_write)
			create l_printer.make (l_output_file)
			if attached l_ecf_config.ecf_version as l_ecf_version then
				l_printer.set_ecf_version (l_ecf_version)
			end
			l_ecf_config.process (l_printer)
			l_printer.set_null_file
			l_output_file.close
			assert_files_equal ("ecf_diff", input_filename, "gobo.txt")
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
			if attached old_cwd as l_old_cwd then
				file_system.cd (l_old_cwd)
				-- file_system.recursive_delete_directory (testdir)
				old_cwd := Void
			end
		end

	old_cwd: detachable STRING
			-- Initial current working directory

feature {NONE} -- Implementation

	testdir: STRING = "Ttools"
			-- Name of temporary directory where to run the test

	input_filename: STRING
			-- Name of ECF file used for the test
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "unit", "data", "test_ecf_printer_1.ecf">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			input_filename_not_void: Result /= Void
			input_filename_not_empty: not Result.is_empty
		end

end
