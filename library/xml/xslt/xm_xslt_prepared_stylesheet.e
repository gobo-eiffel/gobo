indexing

	description:

		"Objects that represent a compiled stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PREPARED_STYLESHEET

inherit

	XM_XPATH_SHARED_NAME_POOL

	XM_XSLT_CONFIGURATION_CONSTANTS
	
	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
			create stripper_rules.make
		ensure
			configuration_set: configuration = a_configuration
		end

feature -- Access

	configuration: XM_XSLT_CONFIGURATION
			-- User configuration options

	executable: XM_XSLT_EXECUTABLE
			-- Executable form of the stylesheet

	node_factory: XM_XSLT_NODE_FACTORY
			-- Node factory used to compile the stylesheet

	last_loaded_module: XM_XPATH_TREE_DOCUMENT
			-- Last stylesheet module sucessfully loaded

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Last error listener used by `prepare'

	stripper_rules: XM_XSLT_MODE
			-- Strip/preserve space rules

feature -- Status report

	load_stylesheet_module_failed: BOOLEAN
			-- did last call to `load_(principal_)stylesheet_module' fail?

	load_stylesheet_module_error: STRING
			-- Error reported by last call to `load_(principal_)stylesheet_module'

feature -- Compilation

	prepare (a_source: XM_XSLT_URI_SOURCE) is
			-- Prepare a stylesheet from a source document.
		require
			source_not_void: a_source /= Void
		local
			a_node_factory: XM_XSLT_NODE_FACTORY
		do
			error_listener := configuration.error_listener
			create a_node_factory.make (error_listener, configuration.are_external_functions_allowed)
			load_principal_stylesheet_module (a_source, configuration, a_node_factory)
			if not load_stylesheet_module_failed then
				create_style_sheet_executable (last_loaded_module, a_node_factory)
			end
		end

	load_stylesheet_module (a_source: XM_XSLT_URI_SOURCE; a_stream: KI_CHARACTER_INPUT_STREAM; a_system_id: UT_URI; a_configuration: XM_XSLT_CONFIGURATION; a_node_factory: XM_XSLT_NODE_FACTORY) is
			-- Create a tree-representation of a subordinate stylesheet module
		require
			source_not_void: a_source /= Void
			stream_open_read: a_stream /= Void and then a_stream.is_open_read
			system_id_is_absolute: a_system_id /= Void and then a_system_id.is_absolute
			configuration_not_void: a_configuration /= Void
			node_factory_not_void: a_node_factory /= Void
			no_error_loading_previous_stylesheet_modules: not load_stylesheet_module_failed
		local
			a_stylesheet_stripper: XM_XSLT_STYLESHEET_STRIPPER
			a_comment_stripper: XM_XSLT_COMMENT_STRIPPER
			a_tree_builder: XM_XPATH_TREE_BUILDER
			a_parser: XM_EIFFEL_PARSER
			a_locator: XM_XPATH_RESOLVER_LOCATOR
		do
			load_stylesheet_module_error := Void
			last_loaded_module := Void
			create a_parser.make
			a_parser.set_resolver (a_configuration.entity_resolver)
			a_parser.copy_string_mode (a_configuration)

			create a_tree_builder.make (a_node_factory)
			create a_locator.make (a_parser)
			a_tree_builder.set_document_locator (a_locator)
			a_tree_builder.set_line_numbering (a_configuration.is_line_numbering)
			create a_stylesheet_stripper.make (a_tree_builder)
			create a_comment_stripper.make (a_stylesheet_stripper)
			a_source.send_from_stream (a_stream, a_system_id, a_parser, a_comment_stripper, True)
			if a_tree_builder.has_error then
				load_stylesheet_module_failed := True
				load_stylesheet_module_error := a_tree_builder.last_error
			else
				last_loaded_module := a_tree_builder.tree_document
			end
		ensure
			stylesheet_module_load_failed: load_stylesheet_module_failed implies load_stylesheet_module_error /= Void and then last_loaded_module = Void
		end

	load_principal_stylesheet_module (a_source: XM_XSLT_URI_SOURCE; a_configuration: XM_XSLT_CONFIGURATION; a_node_factory: XM_XSLT_NODE_FACTORY) is
			-- Create a tree-representation of principal stylesheet module
		require
			source_not_void: a_source /= Void
			configuration_not_void: a_configuration /= Void
			node_factory_not_void: a_node_factory /= Void
			no_error_loading_previous_stylesheet_modules: not load_stylesheet_module_failed
		local
			a_stylesheet_stripper: XM_XSLT_STYLESHEET_STRIPPER
			a_comment_stripper: XM_XSLT_COMMENT_STRIPPER
			a_tree_builder: XM_XPATH_TREE_BUILDER
			a_parser: XM_EIFFEL_PARSER
			a_locator: XM_XPATH_RESOLVER_LOCATOR
		do
			load_stylesheet_module_error := Void
			last_loaded_module := Void
			create a_parser.make
			a_parser.set_resolver (a_configuration.entity_resolver)
			a_parser.copy_string_mode (a_configuration)

			create a_tree_builder.make (a_node_factory)
			create a_locator.make (a_parser)
			a_tree_builder.set_document_locator (a_locator)
			a_tree_builder.set_line_numbering (a_configuration.is_line_numbering)
			create a_stylesheet_stripper.make (a_tree_builder)
			create a_comment_stripper.make (a_stylesheet_stripper)
			a_source.send (a_parser, a_comment_stripper, True)
			if a_tree_builder.has_error then
				load_stylesheet_module_failed := True
				load_stylesheet_module_error := a_tree_builder.last_error
			else
				last_loaded_module := a_tree_builder.tree_document
			end
		ensure
			stylesheet_module_load_failed: load_stylesheet_module_failed implies load_stylesheet_module_error /= Void and then last_loaded_module = Void
		end

	create_style_sheet_executable (a_document: XM_XPATH_TREE_DOCUMENT; a_node_factory: XM_XSLT_NODE_FACTORY) is
			-- Create an executable stylesheet.
		require
			document_not_void: a_document /= Void
			node_factory_not_void: a_node_factory /= Void
			no_error_loading_stylesheet_modules: not load_stylesheet_module_failed
		local
			a_stylesheet_document: XM_XPATH_TREE_DOCUMENT
			a_stylesheet: XM_XSLT_STYLESHEET
			a_top_node: XM_XSLT_LITERAL_RESULT_ELEMENT
		do
			a_stylesheet_document := a_document
			node_factory := a_node_factory

			-- If top-level node is a literal result element, stitch it into a skeleton stylesheet

			a_top_node ?= a_stylesheet_document.document_element
			if a_top_node /= Void then
				todo ("create_style_sheet_executable (literal result stylesheet facility is not yet supported)", True)
			end
			a_stylesheet ?= a_stylesheet_document.document_element
			if a_stylesheet = Void then
				todo ("Top-level element of stylesheet is not xsl:stylesheet or xsl:transform or literal result element", True)
			elseif not a_stylesheet.is_error then

				-- Preprocess the stylesheet, performing validation and preparing template  definitions
				
				a_stylesheet.set_prepared_stylesheet (Current)
				a_stylesheet.preprocess

				-- Compile the stylesheet, retaining the resulting  executable

				if not a_stylesheet.any_compile_errors then
					a_stylesheet.compile_stylesheet (configuration)
				end
				if a_stylesheet.any_compile_errors then
					load_stylesheet_module_failed := True
					load_stylesheet_module_error := "There were error compiling the stylesheet"
				else
					executable ?= a_stylesheet.last_compiled_executable
					check
						executable: executable /= Void
						-- as {XM_XSLT_STYLESHEET}.compile produces an executable if no error.
					end
					executable.save_static_context (a_stylesheet.static_context)
				end
			end
		ensure
			node_factory_set: node_factory = a_node_factory
		end

feature -- Creation

	new_transformer: XM_XSLT_TRANSFORMER is
			-- New transformer for this stylesheet
		require
			executable: executable /= Void
		do
			create Result.make (configuration, Current)
		ensure
			result_not_void: Result /= Void
		end

invariant
	
	configuration_not_void: configuration /= Void
	stylesheet_module_load_suceeded: not load_stylesheet_module_failed implies load_stylesheet_module_error = Void -- and then last_loaded_module /= Void

end
