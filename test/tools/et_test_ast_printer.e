indexing

	description:

		"Test features of class ET_AST_PRINTER"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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

feature -- Test

	test_printer is
			-- Test printer with the Eiffel classes of the
			-- precomp Ace file.
		local
			an_xace_file: KL_TEXT_INPUT_FILE
			a_xace_parser: ET_XACE_UNIVERSE_PARSER
			a_xace_error_handler: ET_XACE_ERROR_HANDLER
			a_xace_variables: ET_XACE_VARIABLES
			a_universe: ET_UNIVERSE
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			a_printer: ET_AST_PRINTER
			a_file: KL_TEXT_OUTPUT_FILE
			old_count, new_count: INTEGER
		do
			!! an_xace_file.make (xace_filename)
			an_xace_file.open_read
			assert ("xace_file_opened", an_xace_file.is_open_read)
			!! a_xace_error_handler.make_standard
			!! a_xace_variables.make
			a_xace_variables.define_value ("GOBO_EIFFEL", eiffel_compiler.vendor)
			!! a_xace_parser.make_with_variables (a_xace_variables, a_xace_error_handler)
			a_xace_parser.parse_file (an_xace_file)
			an_xace_file.close
			assert ("xace_parsed", not a_xace_error_handler.has_error)
			a_universe := a_xace_parser.last_universe
			assert ("universe_not_void", a_universe /= Void)
			!! a_printer.make_null
			a_universe.eiffel_parser.set_keep_all_breaks (True)
			a_universe.eiffel_parser.set_use_reference_keyword (True)
			a_universe.preparse_multiple
			a_cursor := a_universe.classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if not eiffel_compiler.is_ve or else not a_class.name.name.is_equal ("SORTED_ARRAY") then
						-- Class SORTED_ARRAY in VE 4.0 has a feature named `create'.
					if a_class.is_preparsed then
						if not a_class.is_parsed then
								-- If the class has already been parsed, this means that it
								-- is contained in a file containing more than one class
								-- text (allowed in VE). This is case is not handled by the
								-- current test.
							a_class.parse
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
								!! a_file.make ("gobo.txt")
								a_file.open_write
								assert ("is_open_write", a_file.is_open_write)
								a_printer.set_file (a_file)
								a_printer.process_class (a_class)
								a_printer.set_null_file
								a_file.close
								assert_files_equal (a_class.name.name + "_diff", a_class.filename, "gobo.txt")
							end
							old_count := new_count
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
