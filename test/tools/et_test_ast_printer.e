indexing

	description:

		"Test features of class ET_AST_PRINTER"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TEST_AST_PRINTER

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

feature -- Test

	test_printer is
			-- Test printer with the Eiffel classes of the
			-- precomp Ace file.
		local
			an_xace_file: KL_TEXT_INPUT_FILE
			an_xace_parser: ET_XACE_UNIVERSE_PARSER
			an_xace_ast_factory: ET_XACE_AST_FACTORY
			an_eiffel_ast_factory: ET_DECORATED_AST_FACTORY
			an_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			an_xace_variables: DS_HASH_TABLE [STRING, STRING]
			a_universe: ET_UNIVERSE
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			a_printer: ET_AST_PRINTER
			a_file: KL_TEXT_OUTPUT_FILE
			old_count, new_count: INTEGER
			a_prefixed_name: STRING
			a_full_test: BOOLEAN
			ve_os: STRING
		do
			create an_xace_file.make (xace_filename)
			an_xace_file.open_read
			assert ("xace_file_opened", an_xace_file.is_open_read)
			create an_xace_error_handler.make_standard
			create an_xace_variables.make_map (100)
			an_xace_variables.set_key_equality_tester (string_equality_tester)
			an_xace_variables.force_last (eiffel_compiler.vendor, "GOBO_EIFFEL")
			if eiffel_compiler.is_ve then
				ve_os := Execution_environment.variable_value ("VE_OS")
				if ve_os /= Void and then ve_os.count > 0 then
					an_xace_variables.force_last (ve_os, "VE_OS")
				elseif operating_system.is_windows then
					an_xace_variables.force_last ("Win32", "VE_OS")
				else
					an_xace_variables.force_last ("Linux", "VE_OS")
				end
			end
			create an_xace_ast_factory.make
			create an_eiffel_ast_factory.make
			an_eiffel_ast_factory.set_keep_all_breaks (True)
			create an_xace_parser.make_with_variables_and_factory (an_xace_variables, an_xace_ast_factory, an_xace_error_handler)
			an_xace_parser.set_eiffel_ast_factory (an_eiffel_ast_factory)
			an_xace_parser.parse_file (an_xace_file)
			an_xace_file.close
			assert ("xace_parsed", not an_xace_error_handler.has_error)
			a_universe := an_xace_parser.last_universe
			assert ("universe_not_void", a_universe /= Void)
			a_universe.set_use_assign_keyword (True)
			a_universe.set_use_attribute_keyword (False)
			a_universe.set_use_convert_keyword (True)
			a_universe.set_use_create_keyword (True)
			a_universe.set_use_recast_keyword (False)
			a_universe.set_use_reference_keyword (True)
			if eiffel_compiler.is_ve then
				a_universe.set_use_void_keyword (False)
			else
				a_universe.set_use_void_keyword (True)
			end
			if eiffel_compiler.is_ve then
				a_universe.preparse_multiple
			else
				a_universe.preparse_single
			end
			a_full_test :=  variables.has ("full_test")
			create a_printer.make_null (a_universe)
			a_cursor := a_universe.classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if
					(not eiffel_compiler.is_ve or else not a_class.name.name.same_string ("SORTED_ARRAY")) and
						-- Class SORTED_ARRAY in VE 4.0 has a feature named `create'.
					(not eiffel_compiler.is_ise or else not a_class.name.name.same_string ("ANY"))
						-- Class ANY in ISE 5.4 has 'Void' as a feature and not as a keyword.
				then
					if a_class.is_in_cluster then
						a_prefixed_name := a_class.group.prefixed_name
						if a_full_test or else (a_prefixed_name.count > 2 and then (a_prefixed_name.item (1) = 'd' and a_prefixed_name.item (2) = 't')) then
							if not a_class.is_parsed then
									-- If the class has already been parsed, this means that it
									-- is contained in a file containing more than one class
									-- text (allowed in VE). This is case is not handled by the
									-- current test.
								a_class.process (a_universe.eiffel_parser)
								assert (a_class.name.name + "_parsed", a_class.is_parsed)
								assert (a_class.name.name + "_no_syntax_error", not a_class.has_syntax_error)
								if eiffel_compiler.is_ve then
									new_count := a_universe.parsed_classes_count
								else
									new_count := old_count + 1
								end
								if new_count = old_count + 1 then
										-- Do not handle files containing more
										-- than one class text (allowed by VE).
									create a_file.make ("gobo.txt")
									a_file.open_write
									assert ("is_open_write", a_file.is_open_write)
									a_printer.set_file (a_file)
									a_class.process (a_printer)
									a_printer.set_null_file
									a_file.close
									assert_files_equal (a_class.name.name + "_diff", a_class.filename, "gobo.txt")
								end
								old_count := new_count
							end
						end
					end
				end
				a_cursor.forth
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
