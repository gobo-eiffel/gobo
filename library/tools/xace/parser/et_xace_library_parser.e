indexing

	description:

		"Xace library parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_LIBRARY_PARSER

inherit

	ET_XACE_PARSER
		redefine
			parse_file
		end

creation

	make, make_with_factory, make_with_variables,
	make_with_variables_and_factory

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Xace file `a_file'.
		do
			last_library := Void
			if xml_parser /= Void then
				xml_parser.parse_from_stream (a_file)
				if xml_parser.is_correct then
					xml_validator.validate_library_doc (xml_parser.document, xml_parser.last_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_composite (xml_parser.document, xml_parser.last_position_table)
						last_library := new_library (xml_parser.document.root_element, xml_parser.last_position_table)
						parsed_libraries.wipe_out
					end
				else
					error_handler.report_parser_error (xml_parser.last_error_extended_description)
				end
			else
				error_handler.report_no_parser_available_error
			end
		end

	parse_library (a_library: ET_XACE_LIBRARY; a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Xace file `a_file' and fill `a_library'.
		require
			a_library_not_void: a_library /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			last_library := Void
			if xml_parser /= Void then
				xml_parser.parse_from_stream (a_file)
				if xml_parser.is_correct then
					xml_validator.validate_library_doc (xml_parser.document, xml_parser.last_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_composite (xml_parser.document, xml_parser.last_position_table)
						fill_library (a_library, xml_parser.document.root_element, xml_parser.last_position_table)
					end
				else
					error_handler.report_parser_error (xml_parser.last_error_extended_description)
				end
			else
				error_handler.report_no_parser_available_error
			end
		end

feature -- Access

	last_library: ET_XACE_LIBRARY
			-- Library being parsed

end
