note

	description:

		"Xace system parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_SYSTEM_CONFIG_PARSER

inherit

	ET_XACE_PARSER
		redefine
			parse_file
		end

create

	make, make_with_factory, make_with_variables,
	make_with_variables_and_factory, make_standard

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse Xace file `a_file'.
		local
			a_document: XM_DOCUMENT
			a_root_element: XM_ELEMENT
			a_position_table: XM_POSITION_TABLE
		do
			last_system := Void
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					a_document := tree_pipe.document
					a_root_element := a_document.root_element
					a_position_table := tree_pipe.tree.last_position_table
					xml_validator.validate_system_doc (a_document, a_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_element (a_root_element, a_position_table)
						last_system := new_system (a_root_element, a_position_table)
						parsed_libraries.wipe_out
					end
				else
					error_handler.report_parser_error (tree_pipe.last_error)
				end
			else
				error_handler.report_parser_error (xml_parser.last_error_extended_description)
			end
		end

feature -- Access

	last_system: ET_XACE_SYSTEM_CONFIG
			-- Xace system being parsed

end
