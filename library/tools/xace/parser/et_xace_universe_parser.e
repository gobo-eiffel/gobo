indexing

	description:

		"Xace universe parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_UNIVERSE_PARSER

inherit

	ET_XACE_SYSTEM_PARSER
		rename
			last_system as last_universe
		redefine
			parse_file, last_universe
		end

creation

	make, make_with_variables

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Xace file `a_file'.
		do
			last_universe := Void
			if xml_parser /= Void then
				xml_parser.parse_from_stream (a_file)
				if xml_parser.is_correct then
					xml_validator.validate_system_doc (xml_parser.document, xml_parser.last_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_composite (xml_parser.document, xml_parser.last_position_table)
						last_universe := new_universe (xml_parser.document.root_element)
					end
				else
					error_handler.report_parser_error (xml_parser.last_error_extended_description)
				end
			else
				error_handler.report_no_parser_available_error
			end
		end

feature -- Access

	last_universe: ET_XACE_UNIVERSE
			-- Universe being parsed

end
