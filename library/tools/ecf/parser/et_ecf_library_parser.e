indexing

	description:

		"ECF Eiffel library parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_LIBRARY_PARSER

inherit

	ET_ECF_PARSER
		redefine
			parse_file
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make, make_standard, make_with_factory

feature -- Access

	last_library: ET_ECF_LIBRARY
			-- Eiffel library being parsed

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse ECF file `a_file'.
		do
			last_library := Void
			precursor (a_file)
		end

feature {NONE} -- Element change

	build_system_config (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_filename: STRING) is
			-- Build system config from `an_element'.
		local
			l_library: ET_ECF_LIBRARY
			l_system: ET_SYSTEM
		do
			if enclosing_universe /= Void then
				l_system := enclosing_universe.current_system
			else
				l_system := tokens.empty_system
			end
			l_library := new_library (an_element, a_position_table, a_filename, l_system)
-- TODO: check that there is no cycles in targets.
			last_library := l_library
		end

end
