indexing

	description:

		"Gobo Eiffel Lint"

	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GELINT

inherit

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

creation

	execute

feature -- Execution

	execute is
			-- Start 'gelint' execution.
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_lace_parser: ET_LACE_PARSER
			a_lace_error_handler: ET_LACE_ERROR_HANDLER
			a_lace_ast_factory: ET_LACE_AST_FACTORY
			an_xace_parser: ET_XACE_UNIVERSE_PARSER
			an_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			an_xace_ast_factory: ET_XACE_AST_FACTORY
			an_eiffel_ast_factory: ET_DECORATED_AST_FACTORY
			an_xace_variables: ET_XACE_VARIABLES
			a_null_error_handler: ET_NULL_ERROR_HANDLER
			gobo_eiffel: STRING
			a_universe: ET_UNIVERSE
			i, nb: INTEGER
			arg: STRING
		do
			Arguments.set_program_name ("gelint")
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if equal (arg, "--all_breaks") then
					all_breaks := True
				elseif equal (arg, "--verbose") then
					is_verbose := True
				elseif equal (arg, "--cat") then
					is_cat := True
				elseif equal (arg, "--forget") then
					is_forget := True
				elseif equal (arg, "--flat") then
					is_flat := True
				elseif equal (arg, "--compile") then
					do_compile := True
				elseif equal (arg, "--no_output") then
					no_output := True
				elseif i = nb then
					a_filename := arg
				else
					std.error.put_line ("usage: gelint [--verbose][--all_breaks][--cat][--forget][--flat] filename")
					Exceptions.die (1)
				end
				i := i + 1
			end
			if a_filename = Void then
				std.error.put_line ("usage: gelint [--verbose][--all_breaks][--cat][--forget][--flat] filename")
				Exceptions.die (1)
			else
				create a_file.make (a_filename)
				a_file.open_read
				if a_file.is_open_read then
					nb := a_filename.count
					if nb > 5 and then a_filename.substring (nb - 4, nb).is_equal (".xace") then
						create an_xace_error_handler.make_standard
						create an_xace_variables.make
						gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
						if gobo_eiffel /= Void then
							an_xace_variables.define_value ("GOBO_EIFFEL", gobo_eiffel)
						end
						if all_breaks then
							create an_xace_ast_factory.make
							create an_xace_parser.make_with_variables_and_factory (an_xace_variables, an_xace_ast_factory, an_xace_error_handler)
							create an_eiffel_ast_factory.make
							an_eiffel_ast_factory.set_keep_all_breaks (True)
							an_xace_parser.set_eiffel_ast_factory (an_eiffel_ast_factory)
							if no_output then
								create a_null_error_handler.make_standard
								an_xace_parser.set_eiffel_error_handler (a_null_error_handler)
							end
						else
							create an_xace_parser.make_with_variables (an_xace_variables, an_xace_error_handler)
							if no_output then
								create a_null_error_handler.make_standard
								an_xace_parser.set_eiffel_error_handler (a_null_error_handler)
							end
						end
						an_xace_parser.parse_file (a_file)
						a_file.close
						if not an_xace_error_handler.has_error then
							a_universe := an_xace_parser.last_universe
						end
					else
						create a_lace_error_handler.make_standard
						if all_breaks then
							create a_lace_ast_factory.make
							create an_eiffel_ast_factory.make
							an_eiffel_ast_factory.set_keep_all_breaks (True)
							a_lace_ast_factory.set_ast_factory (an_eiffel_ast_factory)
							if no_output then
								create a_null_error_handler.make_standard
								a_lace_ast_factory.set_error_handler (a_null_error_handler)
							end
							create a_lace_parser.make_with_factory (a_lace_ast_factory, a_lace_error_handler)
						elseif no_output then
							create a_lace_ast_factory.make
							create a_null_error_handler.make_standard
							a_lace_ast_factory.set_error_handler (a_null_error_handler)
							create a_lace_parser.make_with_factory (a_lace_ast_factory, a_lace_error_handler)
						else
							create a_lace_parser.make (a_lace_error_handler)
						end
						a_lace_parser.parse_file (a_file)
						a_file.close
						if not a_lace_parser.syntax_error then
							a_universe := a_lace_parser.last_universe
						end
					end
					if a_universe /= Void then
						process_universe (a_universe)
					end
				else
					std.error.put_string ("gelint: cannot read %'")
					std.error.put_string (a_filename)
					std.error.put_line ("%'")
				end
			end
			debug ("stop")
				std.output.put_line ("Press Enter...")
				io.read_line
			end
		end

feature -- Status report

	all_breaks: BOOLEAN
	is_verbose: BOOLEAN
	is_cat: BOOLEAN
	is_forget: BOOLEAN
	is_flat: BOOLEAN
	do_compile: BOOLEAN
	no_output: BOOLEAN
			-- Command-line options

feature {NONE} -- Processing

	process_universe (a_universe: ET_UNIVERSE) is
			-- Process `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_system: ET_SYSTEM
		do
--			a_universe.error_handler.set_compilers
			a_universe.error_handler.set_ise
			if not is_verbose then
				a_universe.error_handler.set_info_null
			else
				a_universe.error_handler.set_compilers
			end
			a_universe.set_use_assign_keyword (True)
			a_universe.set_use_attribute_keyword (False)
			a_universe.set_use_convert_keyword (True)
			a_universe.set_use_recast_keyword (True)
			a_universe.set_use_reference_keyword (True)
			a_universe.set_use_void_keyword (True)
			if is_cat then
				a_universe.set_cat_enabled (True)
				a_universe.set_anchored_cat_features (False)
			else
				a_universe.set_cat_enabled (False)
			end
			a_universe.set_forget_enabled (is_forget)
			if do_compile then
				create a_system.make (a_universe)
				a_system.compile
				debug ("stop")
					std.error.put_line ("System built")
					io.read_line
				end
			else
				a_universe.compile (is_flat)
			end
		end

end
