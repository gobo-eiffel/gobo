indexing

	description:

		"Xace universe parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make, make_with_factory, make_with_variables,
	make_with_variables_and_factory

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Xace file `a_file'.
		local
			a_document: XM_DOCUMENT
			a_root_element: XM_ELEMENT
			a_position_table: XM_POSITION_TABLE
		do
			last_universe := Void
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					a_document := tree_pipe.document
					a_root_element := a_document.root_element
					a_position_table := tree_pipe.tree.last_position_table
					xml_validator.validate_system_doc (a_document, a_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_element (a_root_element, a_position_table)
						last_universe := new_universe (a_root_element, a_position_table)
					end
				else
					error_handler.report_parser_error (tree_pipe.last_error)
				end
			else
				error_handler.report_parser_error (xml_parser.last_error_extended_description)
			end
		end

feature -- Access

	last_universe: ET_XACE_UNIVERSE
			-- Universe being parsed

end
