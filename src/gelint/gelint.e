indexing

	description:

		"Gobo Eiffel Lint"

	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
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

feature -- Processing

	execute is
			-- Start 'gelint' execution.
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_lace_parser: ET_LACE_PARSER
			a_lace_error_handler: ET_LACE_ERROR_HANDLER
			a_lace_ast_factory: ET_LACE_AST_FACTORY
			an_xace_parser: ET_XACE_UNIVERSE_PARSER
			an_xace_error_handler: ET_XACE_ERROR_HANDLER
			an_xace_ast_factory: ET_XACE_AST_FACTORY
			an_eiffel_ast_factory: ET_DECORATED_AST_FACTORY
			an_xace_variables: ET_XACE_VARIABLES
			gobo_eiffel: STRING
			a_universe: ET_UNIVERSE
			all_breaks: BOOLEAN
			is_verbose: BOOLEAN
			nb: INTEGER
		do
			inspect Arguments.argument_count
			when 1 then
				a_filename := Arguments.argument (1)
			when 2 then
				if equal (Arguments.argument (1), "--all_breaks") then
					all_breaks := True
					a_filename := Arguments.argument (2)
				elseif equal (Arguments.argument (1), "--verbose") then
					is_verbose := True
					a_filename := Arguments.argument (2)
				else
					std.error.put_line ("usage: gelint filename")
					Exceptions.die (1)
				end
			when 3 then
				if equal (Arguments.argument (1), "--all_breaks") then
					all_breaks := True
					if equal (Arguments.argument (2), "--verbose") then
						is_verbose := True
						a_filename := Arguments.argument (3)
					else
						std.error.put_line ("usage: gelint filename")
						Exceptions.die (1)
					end
				elseif equal (Arguments.argument (1), "--verbose") then
					is_verbose := True
					if equal (Arguments.argument (2), "--all_breaks") then
						all_breaks := True
						a_filename := Arguments.argument (3)
					else
						std.error.put_line ("usage: gelint filename")
						Exceptions.die (1)
					end
				else
					std.error.put_line ("usage: gelint filename")
					Exceptions.die (1)
				end
			else
				std.error.put_line ("usage: gelint filename")
				Exceptions.die (1)
			end
			if a_filename /= Void then
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
							create an_eiffel_ast_factory.make
							an_eiffel_ast_factory.set_keep_all_breaks (True)
							an_xace_ast_factory.set_ast_factory (an_eiffel_ast_factory)
							create an_xace_parser.make_with_variables_and_factory (an_xace_variables, an_xace_ast_factory, an_xace_error_handler)
						else
							create an_xace_parser.make_with_variables (an_xace_variables, an_xace_error_handler)
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
							create a_lace_parser.make_with_factory (a_lace_ast_factory, a_lace_error_handler)
						else
							create a_lace_parser.make (a_lace_error_handler)
						end
						a_lace_parser.parse (a_file)
						a_file.close
						if not a_lace_parser.syntax_error then
							a_universe := a_lace_parser.last_universe
						end
					end
					if a_universe /= Void then
						if not is_verbose then
							a_universe.error_handler.set_info_null
						else
							a_universe.error_handler.set_compilers
						end
						process_universe (a_universe)
					end
				else
					std.error.put_string ("gelint: cannot read %'")
					std.error.put_string (a_filename)
					std.error.put_line ("%'")
				end
			end
debug ("ericb")
	io.read_line
end
		end

	process_universe (a_universe: ET_UNIVERSE) is
			-- Process `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
--			a_universe.error_handler.set_compilers
			a_universe.error_handler.set_ise
			a_universe.set_use_attribute_keyword (False)
			a_universe.set_use_convert_keyword (True)
			a_universe.set_use_recast_keyword (True)
			a_universe.set_use_reference_keyword (False)
			a_universe.compile
		end

end
