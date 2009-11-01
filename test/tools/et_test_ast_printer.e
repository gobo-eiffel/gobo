indexing

	description:

		"Test features of class ET_AST_PRINTER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TEST_AST_PRINTER

inherit

	TS_TEST_CASE
		redefine
			set_up, tear_down
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	UT_SHARED_ECMA_VERSIONS
		export {NONE} all end

create

	make_default

feature -- Test

	test_printer is
			-- Test printer with the Eiffel classes of the
			-- precomp Ace file.
		local
			an_xace_file: KL_TEXT_INPUT_FILE
			an_xace_parser: ET_XACE_SYSTEM_PARSER
			an_xace_ast_factory: ET_XACE_AST_FACTORY
			an_eiffel_ast_factory: ET_DECORATED_AST_FACTORY
			an_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			an_xace_variables: DS_HASH_TABLE [STRING, STRING]
			a_system: ET_SYSTEM
			ise_version: UT_VERSION
			ecma_version: UT_VERSION
		do
			create an_xace_file.make (xace_filename)
			an_xace_file.open_read
			assert ("xace_file_opened", an_xace_file.is_open_read)
			create an_xace_error_handler.make_standard
			create an_xace_variables.make_map (100)
			an_xace_variables.set_key_equality_tester (string_equality_tester)
			an_xace_variables.force_last (eiffel_compiler.vendor, "GOBO_EIFFEL")
			create an_xace_ast_factory.make
			create an_eiffel_ast_factory.make
			an_eiffel_ast_factory.set_keep_all_breaks (True)
			create an_xace_parser.make_with_variables_and_factory (an_xace_variables, an_xace_ast_factory, an_xace_error_handler)
			an_xace_parser.set_eiffel_ast_factory (an_eiffel_ast_factory)
			an_xace_parser.parse_file (an_xace_file)
			an_xace_file.close
			assert ("xace_parsed", not an_xace_error_handler.has_error)
			a_system := an_xace_parser.last_system
			assert ("system_not_void", a_system /= Void)
			if eiffel_compiler.is_ise then
				ise_version := ise_latest
			elseif eiffel_compiler.is_ge then
				ise_version := ise_latest
			end
			a_system.set_ise_version (ise_version)
			a_system.set_ecma_version (ecma_version)
				-- We restrict this test to files that contain only one class.
			a_system.set_preparse_single_mode
			a_system.activate_processors
			a_system.preparse_recursive
			a_system.classes_do_recursive (agent check_class)
		end

feature {NONE} -- Test

	check_class (a_class: ET_CLASS) is
			-- Check that after parsing `a_class' and printing back its AST,
			-- we get two files containing the same text.
		require
			a_class_not_void: a_class /= Void
		local
			l_printer: ET_AST_PRINTER
			l_file: KL_TEXT_OUTPUT_FILE
			l_prefixed_name: STRING
			l_full_test: BOOLEAN
		do
			if a_class.is_in_cluster then
				l_full_test := variables.has ("full_test")
				l_prefixed_name := a_class.group.prefixed_name
				if l_full_test or else (l_prefixed_name.count > 2 and then (l_prefixed_name.item (1) = 'd' and l_prefixed_name.item (2) = 't')) then
					a_class.process (a_class.current_system.eiffel_parser)
					assert (a_class.lower_name + "_parsed", a_class.is_parsed)
					assert (a_class.lower_name + "_no_syntax_error", not a_class.has_syntax_error)
					create l_file.make ("gobo.txt")
					l_file.open_write
					assert ("is_open_write", l_file.is_open_write)
					create l_printer.make_null
					l_printer.set_file (l_file)
					a_class.process (l_printer)
					l_printer.set_null_file
					l_file.close
					assert_files_equal (a_class.lower_name + "_diff", a_class.filename, "gobo.txt")
				end
			end
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

	testdir: STRING is "Ttools"
			-- Name of temporary directory where to run the test

	xace_filename: STRING is
			-- Name of Xace file used for the test
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "tools", "data", "system.xace">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			xace_filename_not_void: Result /= Void
			xace_filename_not_empty: Result.count > 0
		end

end
