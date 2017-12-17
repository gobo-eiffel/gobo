note

	description:

	"[
		ECF file parsers.
		Do not parse ECF files it depends on.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SYSTEM_CONFIG_PARSER

inherit

	ET_ECF_PARSER
		redefine
			parse_file
		end

create

	make, make_standard, make_with_factory

feature -- Access

	last_system_config: detachable ET_ECF_SYSTEM_CONFIG
			-- ECF system config being parsed

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse ECF file `a_file'.
		do
			last_system_config := Void
			precursor (a_file)
		end

feature {NONE} -- Element change

	build_system_config (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING)
			-- Build system config from `a_element'.
		do
			last_system_config := new_system (a_element, a_position_table, a_filename)
		end

end
