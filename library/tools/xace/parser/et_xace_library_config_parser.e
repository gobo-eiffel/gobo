note

	description:

		"Xace library parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_LIBRARY_CONFIG_PARSER

inherit

	ET_XACE_PARSER
		redefine
			parse_file,
			create_library_parser
		end

create

	make, make_with_factory, make_with_variables,
	make_with_variables_and_factory, make_standard

feature {NONE} -- Initialization

	create_library_parser (a_variables: KL_VALUES [STRING, STRING];
		a_factory: like ast_factory; an_error_handler: like error_handler)
			-- Create `library_parser', or set it to `Current' in descendant class
			-- ET_XACE_LIBRARY_CONFIG_PARSER (otherwise we would recurse in
			-- `make_with_variables_and_factory' forever).
		do
			library_parser := Current
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse Xace file `a_file'.
		local
			a_document: XM_DOCUMENT
			a_root_element: XM_ELEMENT
			a_position_table: detachable XM_POSITION_TABLE
		do
			last_library := Void
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					a_document := tree_pipe.document
					a_root_element := a_document.root_element
					a_position_table := tree_pipe.tree.last_position_table
					xml_validator.validate_library_doc (a_document, a_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_element (a_root_element, a_position_table)
						last_library := new_library (a_root_element, a_position_table)
						parsed_libraries.wipe_out
					end
				else
					error_handler.report_parser_error (tree_pipe.last_error)
				end
			else
				error_handler.report_parser_error (xml_parser.last_error_extended_description)
			end
		end

	parse_library (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_CHARACTER_INPUT_STREAM; a_system: ET_SYSTEM)
			-- Parse Xace file `a_file' and fill `a_library'.
		require
			a_library_not_void: a_library /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_system_not_void: a_system /= Void
		local
			a_document: XM_DOCUMENT
			a_root_element: XM_ELEMENT
			a_position_table: detachable XM_POSITION_TABLE
		do
			last_library := Void
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					a_document := tree_pipe.document
					a_root_element := a_document.root_element
					a_position_table := tree_pipe.tree.last_position_table
					xml_validator.validate_library_doc (a_document, a_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_element (a_root_element, a_position_table)
						fill_library (a_library, a_root_element, a_position_table, a_system)
					end
				else
					error_handler.report_parser_error (tree_pipe.last_error)
				end
			else
				error_handler.report_parser_error (xml_parser.last_error_extended_description)
			end
		end

feature -- Access

	last_library: detachable ET_XACE_LIBRARY_CONFIG
			-- Library being parsed

end
