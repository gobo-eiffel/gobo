indexing

	description:

		"Xace parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_PARSER

inherit

	ET_XACE_PARSER_SKELETON
		rename
			make as make_skeleton,
			make_with_factory as make_skeleton_with_factory
		end

creation

	make, make_with_factory, make_with_variables,
	make_with_variables_and_factory

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new Xace parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_variables: ET_XACE_VARIABLES
			a_factory: ET_XACE_AST_FACTORY
		do
			!! a_variables.make
			!! a_factory.make
			make_with_variables_and_factory (a_variables, a_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler) is
			-- Create a new Xace parser using `a_factory' as AST factory.
		require
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_variables: ET_XACE_VARIABLES
		do
			!! a_variables.make
			make_with_variables_and_factory (a_variables, a_factory, an_error_handler)
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

	make_with_variables (a_variables: ET_XACE_VARIABLES an_error_handler: like error_handler) is
			-- Create a new Xace parser with variables defined in `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_XACE_AST_FACTORY
		do
			!! a_factory.make
			make_with_variables_and_factory (a_variables, a_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	make_with_variables_and_factory (a_variables: ET_XACE_VARIABLES;
		a_factory: like ast_factory; an_error_handler: like error_handler) is
			-- Create a new Xace parser with variables defined in `a_variables'
			-- and using `a_factory' as AST factory.
		require
			a_variables_not_void: a_variables /= Void
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_parser_factory: XM_PARSER_FACTORY
		do
			error_handler := an_error_handler
			ast_factory := a_factory
			!! parsed_libraries.make (10)
				-- We must not create a new ET_XACE_LIBRARY_PARSER
				-- object if `Current' is one already, or we will
				-- recurse in this routine forever.
			library_parser ?= Current
			if library_parser = Void then
				!! library_parser.make_with_variables_and_factory (a_variables, a_factory, an_error_handler)
				library_parser.set_parsed_libraries (parsed_libraries)
			end
			!! xml_preprocessor.make (a_variables, error_handler)
			!! xml_validator.make (an_error_handler)
			!! a_parser_factory.make
			if a_parser_factory.is_toe_expat_tree_available then
				xml_parser := a_parser_factory.new_toe_expat_tree_parser
				xml_parser.enable_position_table
			elseif a_parser_factory.is_toe_eiffel_tree_available then
				xml_parser := a_parser_factory.new_toe_eiffel_tree_parser
				xml_parser.enable_position_table
			else
				error_handler.report_no_parser_available_error
			end
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Xace file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			a_root_name: UC_STRING
			a_system: ET_XACE_SYSTEM
			a_library: ET_XACE_LIBRARY
		do
			if xml_parser /= Void then
				xml_parser.parse_from_stream (a_file)
				if xml_parser.is_correct then
					a_root_name := xml_parser.document.root_element.name
					if a_root_name.is_equal (uc_system) then
						xml_validator.validate_system_doc (xml_parser.document, xml_parser.last_position_table)
						if not xml_validator.has_error then
							xml_preprocessor.preprocess_composite (xml_parser.document, xml_parser.last_position_table)
							a_system := new_system (xml_parser.document.root_element, xml_parser.last_position_table)
							parsed_libraries.wipe_out
						end
					elseif
						a_root_name.is_equal (uc_library) or
						a_root_name.is_equal (uc_cluster)
					then
						xml_validator.validate_library_doc (xml_parser.document, xml_parser.last_position_table)
						if not xml_validator.has_error then
							xml_preprocessor.preprocess_composite (xml_parser.document, xml_parser.last_position_table)
							a_library := new_library (xml_parser.document.root_element, xml_parser.last_position_table)
							parsed_libraries.wipe_out
						end
					else
						error_handler.report_not_xace_file_error (a_file.name)
					end
				else
					error_handler.report_parser_error (xml_parser.last_error_extended_description)
				end
			else
				error_handler.report_no_parser_available_error
			end
		end

feature -- Access

	library_parser: ET_XACE_LIBRARY_PARSER
			-- Library Parser

	parsed_libraries: DS_HASH_TABLE [ET_XACE_LIBRARY, STRING]
			-- Already parsed Xace libraries, indexed by filenames

feature -- Setting

	set_parsed_libraries (a_libraries: like parsed_libraries) is
			-- Set `parsed_libraries' to `a_libraries'.
		require
			a_libraries_not_void: a_libraries /= Void
			no_void_library: not a_libraries.has_item (Void)
		do
			parsed_libraries := a_libraries
		ensure
			parsed_libraries_set: parsed_libraries = a_libraries
		end

feature {NONE} -- Implementation

	xml_parser: XM_TREE_PARSER
			-- XML parser

	xml_validator: ET_XACE_VALIDATOR
			-- XML validator

	xml_preprocessor: ET_XACE_PREPROCESSOR
			-- XML preprocessor

invariant

	position_table_enabled: xml_parser /= Void implies xml_parser.is_position_table_enabled
	xml_validator_not_void: xml_validator /= Void
	xml_preprocessor_not_void: xml_preprocessor /= Void

end
