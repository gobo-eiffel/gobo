indexing

	description:

		"Gobo Eiffel Lint"

	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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
			a_xace_parser: ET_XACE_SYSTEM_PARSER
			a_xace_error_handler: ET_XACE_ERROR_HANDLER
			a_xace_variables: ET_XACE_VARIABLES
			gobo_eiffel: STRING
			a_universe: ET_UNIVERSE
			nb: INTEGER
		do
			if Arguments.argument_count /= 1 then
				std.error.put_string ("usage: gelint filename%N")
				Exceptions.die (1)
			else
				a_filename := Arguments.argument (1)
				!! a_file.make (a_filename)
				a_file.open_read
				if a_file.is_open_read then
					nb := a_filename.count
					if nb > 5 and then a_filename.substring (nb - 4, nb).is_equal (".xace") then
						!! a_xace_error_handler.make_standard
						!! a_xace_variables.make
						gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
						if gobo_eiffel /= Void then
							a_xace_variables.define_value ("GOBO_EIFFEL", gobo_eiffel)
						end
						!! a_xace_parser.make_with_variables (a_xace_variables, a_xace_error_handler)
						a_xace_parser.parse_file (a_file)
						a_file.close
						if not a_xace_error_handler.has_error then
							a_universe := a_xace_parser.last_universe
						end
					else
						!! a_lace_error_handler.make_standard
						!! a_lace_parser.make (a_lace_error_handler)
						a_lace_parser.parse (a_file)
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
					std.error.put_string ("%'%N")
				end
			end
io.read_line
		end

	process_universe (a_universe: ET_UNIVERSE) is
			-- Process `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
			a_universe.parse_all
--			a_universe.preparse_single
--			a_universe.parse_system
print ("Parsed ")
print (a_universe.classes.count)
print (" classes%N")
print (a_universe.features.count)
print (" features%N")
io.read_line
			a_universe.compute_ancestors
print ("Done.%N")
print (a_universe.features.count)
print (" features%N")
		end

end -- class GELINT
