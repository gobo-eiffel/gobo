indexing

	description:

		"Xace parsers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_PARSER

inherit

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make, make_with_factory

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new Xace parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_XACE_AST_FACTORY
		do
			!! a_factory.make
			make_with_factory (a_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler) is
			-- Create a new Xace parser.
		require
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_parser_factory: XM_PARSER_FACTORY
		do
			ast_factory := a_factory
			error_handler := an_error_handler
			!! a_parser_factory.make
			if a_parser_factory.is_toe_eiffel_tree_available then
				xml_parser := a_parser_factory.new_toe_eiffel_tree_parser
				xml_parser.enable_position_table
			end
			!! xml_validator.make (an_error_handler)
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Parsing

	parse_file (a_file: like INPUT_STREAM_TYPE) is
			-- Parse Xace file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		local
			a_root_name: UC_STRING
			a_system: ET_XACE_UNIVERSE
			a_cluster: ET_XACE_CLUSTER
			a_clusters: ET_XACE_CLUSTERS
		do
			if xml_parser /= Void then
				xml_parser.parse_from_stream (a_file)
				if xml_parser.is_correct then
					a_root_name := xml_parser.document.root_element.name
					if a_root_name.is_equal (uc_system) then
						xml_validator.validate_system_doc (xml_parser.document, xml_parser.last_position_table)
						if not xml_validator.has_error then
							a_system := ast_factory.new_universe (xml_parser.document.root_element)
							if a_system /= Void then
								a_system.set_variables (variables)
								a_system.mount_clusters
								a_system.unmount_clusters
							end
						end
					elseif a_root_name.is_equal (uc_cluster) then
						xml_validator.validate_cluster_doc (xml_parser.document, xml_parser.last_position_table)
						if not xml_validator.has_error then
							a_cluster := ast_factory.new_cluster (xml_parser.document.root_element)
							if a_cluster /= Void then
								!! a_clusters.make (a_cluster)
								!! a_system.make (a_clusters, error_handler)
								a_system.set_variables (variables)
								a_system.mount_clusters
								a_system.unmount_clusters
							end
						end
					else
						error_handler.report_not_xace_file_error (INPUT_STREAM_.name (a_file))
					end
				else
					error_handler.report_parser_error (xml_parser.last_error_extended_description)
				end
			else
				error_handler.report_no_parser_available_error
			end
		end

feature -- Access

	ast_factory: ET_XACE_AST_FACTORY
			-- Abstract Syntax Tree factory

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

	variables: ET_XACE_VARIABLES
			-- Defined variables

feature -- Setting

	set_variables (a_variables: like variables) is
			-- Set `variables' to `a_variables'.
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

feature {NONE} -- Implementation

	xml_parser: XM_TREE_PARSER
			-- XML parser

	xml_validator: ET_XACE_VALIDATOR
			-- XML validator

invariant

	error_handler_not_void: error_handler /= Void
	ast_factory_not_void: ast_factory /= Void
	position_table_enabled: xml_parser /= Void implies xml_parser.is_position_table_enabled
	xml_validator_not_void: xml_validator /= Void

end -- class ET_XACE_PARSER
