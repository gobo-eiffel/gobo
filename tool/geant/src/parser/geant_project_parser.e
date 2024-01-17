note

	description:

		"XML project parsers"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_PROJECT_PARSER

inherit

	ANY

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_variables: GEANT_PROJECT_VARIABLES; a_options: GEANT_PROJECT_OPTIONS; a_build_filename: STRING)
			-- Initialize project parser.
		require
			a_variables_not_void: a_variables /= Void
			a_options_not_void: a_options /= Void
			a_build_filename_not_void: a_build_filename /= Void
			a_build_filename_not_empty: a_build_filename.count > 0
		local
			an_expat_parser_factory: XM_EXPAT_PARSER_FACTORY
		do
			variables := a_variables
			options := a_options
			build_filename := a_build_filename

			create an_expat_parser_factory
			if an_expat_parser_factory.is_expat_parser_available then
				xml_parser := an_expat_parser_factory.new_expat_parser
			else
				create {XM_EIFFEL_PARSER} xml_parser.make
			end
			xml_parser.set_string_mode_mixed
				-- The parser will build a tree.
			create tree_pipe.make
			xml_parser.set_callbacks (tree_pipe.start)
			tree_pipe.tree.enable_position_table (xml_parser)
		end

feature -- Access

	last_project_element: detachable GEANT_PROJECT_ELEMENT
			-- Root element

	build_filename: STRING
			-- Name of the file containing the configuration
			-- information to build a project

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse eant file `a_file'.
		local
			a_document: XM_DOCUMENT
			a_root_element: XM_ELEMENT
			l_last_project_element: like last_project_element
		do
			last_project_element := Void
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					a_document := tree_pipe.document
					a_root_element := a_document.root_element
					create l_last_project_element.make (a_root_element, variables, options, build_filename)
					l_last_project_element.project.set_position_table (tree_pipe.tree.last_position_table)
					last_project_element := l_last_project_element
				else
					std.error.put_string (tree_pipe.last_error)
					std.error.flush
				end
			else
				std.error.put_string (xml_parser.last_error_extended_description)
				std.error.flush
			end
		end

feature {NONE} -- Implementation

	xml_parser: XM_PARSER
			-- XML parser

	tree_pipe: XM_TREE_CALLBACKS_PIPE
			-- Tree generating callbacks

	variables: GEANT_PROJECT_VARIABLES
			-- Project variables

	options: GEANT_PROJECT_OPTIONS
			-- Project options

invariant

	build_filename_not_void: build_filename /= Void
	build_filename_not_empty: build_filename.count > 0
	xml_parser_not_void: xml_parser /= Void
	tree_pipe_not_void: tree_pipe /= Void

end
