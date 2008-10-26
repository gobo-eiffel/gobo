indexing

	description:

		"ECF parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_PARSER

inherit

	ET_ECF_PARSER_SKELETON
		redefine
			make_with_factory
		end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

feature {NONE} -- Initialization

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler) is
			-- Create a new ECF parser using `a_factory' as AST factory.
		do
			precursor (a_factory, an_error_handler)
			create parsed_libraries.make_map (10)
			parsed_libraries.set_key_equality_tester (case_insensitive_string_equality_tester)
				-- We must not create a new ET_ECF_LIBRARY_PARSER
				-- object if `Current' is one already, or we will
				-- recurse in this routine forever.
			library_parser ?= Current
			if library_parser = Void then
				create library_parser.make_with_factory (a_factory, an_error_handler)
				library_parser.set_parsed_libraries (parsed_libraries)
			end
			create {XM_EIFFEL_PARSER} xml_parser.make
			xml_parser.set_string_mode_mixed
				-- The parser will build a tree.
			create tree_pipe.make
			xml_parser.set_callbacks (tree_pipe.start)
			tree_pipe.tree.enable_position_table (xml_parser)
		end

feature -- Access

	parsed_libraries: DS_HASH_TABLE [ET_ECF_LIBRARY, STRING]
			-- Already parsed ECF libraries, indexed by UUID

	library_parser: ET_ECF_LIBRARY_PARSER
			-- Library Parser

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse ECF file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_root_name: STRING
			l_document: XM_DOCUMENT
			l_root_element: XM_ELEMENT
			l_position_table: XM_POSITION_TABLE
		do
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					l_document := tree_pipe.document
					l_root_element := l_document.root_element
					l_root_name := l_root_element.name
					l_position_table := tree_pipe.tree.last_position_table
					if STRING_.same_string (l_root_name, xml_system) then
						build_system_config (l_root_element, l_position_table, a_file.name)
					else
-- TODO: ECF error
					end
				else
					error_handler.report_parser_error (tree_pipe.last_error)
				end
			else
				error_handler.report_parser_error (xml_parser.last_error_extended_description)
			end
		end

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

feature {NONE} -- Element change

	build_system_config (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_filename: STRING) is
			-- Build system config from `an_element'.
		require
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, xml_system)
			a_position_table_not_void: a_position_table /= Void
			a_filename_not_void: a_filename /= Void
		deferred
		end

feature {NONE} -- Implementation

	xml_parser: XM_PARSER
			-- XML parser

	tree_pipe: XM_TREE_CALLBACKS_PIPE
			-- Tree generating callbacks

invariant

	xml_parser_not_void: xml_parser /= Void
	tree_pipe_not_void: tree_pipe /= Void
	position_table_enabled: tree_pipe.tree.is_position_table_enabled

end
