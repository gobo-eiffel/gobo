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

	target_name_pool: XM_XPATH_NAME_POOL
			-- This is the name pool used for names that need to be accessible
			--   at runtime, notably the names used in XPath expressions in the stylesheet.
			-- A different (local) namepool is used for compile-time-only names in the stylesheet itself.

	last_loaded_module: XM_XPATH_TREE_DOCUMENT
			-- Last stylesheet module sucessfully loaded

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Last error listener used by `prepare'

feature -- Status report

	load_stylesheet_module_failed: BOOLEAN
			-- did last call to `load_stylesheet_module' fail?

	
	load_stylesheet_module_error: STRING
			-- Error reported by last call to `load_stylesheet_module'

feature -- Compliation

	prepare (a_source: XM_XSLT_URI_SOURCE; compile_to_eiffel: BOOLEAN) is
			-- Prepare a stylesheet from a source document.
		require
			source_not_void: a_source /= Void
			compile_to_eiffel_not_supported_yet: compile_to_eiffel = False
		local
			a_name_pool: XM_XPATH_NAME_POOL
			a_node_factory: XM_XSLT_NODE_FACTORY
		do
			create a_name_pool.make
			error_listener := configuration.error_listener
			if error_listener = Void then
				create {XM_XSLT_DEFAULT_ERROR_LISTENER} error_listener.make
			end
			create a_node_factory.make (a_name_pool, error_listener, configuration.are_external_functions_allowed)
			load_stylesheet_module (a_source, configuration, a_name_pool, a_node_factory)
			if load_stylesheet_module_failed then
				todo ("prepare - deal with compile errors", True)
			else
				create_style_sheet_executable (last_loaded_module, a_node_factory, compile_to_eiffel)
			end
		end

	load_stylesheet_module (a_source: XM_XSLT_URI_SOURCE; a_configuration: XM_XSLT_CONFIGURATION; a_name_pool: XM_XPATH_NAME_POOL; a_node_factory: XM_XSLT_NODE_FACTORY) is
			-- Create a tree-representation of a sylesheet module
		require
			source_not_void: a_source /= Void
			configuration_not_void: a_configuration /= Void
			name_pool_not_void: a_name_pool /= Void
			-- TODO - a_node_factory
		local
			a_stylesheet_stripper: XM_XSLT_STYLESHEET_STRIPPER
			a_comment_stripper: XM_XSLT_COMMENT_STRIPPER
			a_tree_builder: XM_XPATH_TREE_BUILDER
		do
			load_stylesheet_module_failed := False
			load_stylesheet_module_error := Void
			last_loaded_module := Void
			create a_tree_builder.make (a_name_pool, a_node_factory)
			-- a_tree_builder.set_line_numbering (True)
			a_tree_builder.set_system_id (a_source.system_id)
			create a_stylesheet_stripper.make (a_name_pool, a_tree_builder)
			create a_comment_stripper.make (a_stylesheet_stripper)
			a_source.send (a_configuration, a_comment_stripper, a_name_pool, True)
			if a_tree_builder.has_error then
				load_stylesheet_module_failed := True
				load_stylesheet_module_error := a_tree_builder.last_error
			else
				last_loaded_module := a_tree_builder.document
			end
		ensure
			stylesheet_module_load_failed: load_stylesheet_module_failed implies load_stylesheet_module_error /= Void and then last_loaded_module = Void
		end

	create_style_sheet_executable (a_document: XM_XPATH_TREE_DOCUMENT; a_node_factory: XM_XSLT_NODE_FACTORY; compile_to_eiffel: BOOLEAN) is
			-- Create an executable stylesheet.
		require
			document_not_void: a_document /= Void
			node_factory_not_void: a_node_factory /= Void
			compile_to_eiffel_not_supported_yet: compile_to_eiffel = False
		local
			a_stylesheet_document: XM_XPATH_TREE_DOCUMENT
			a_stylesheet: XM_XSLT_STYLESHEET
		do
			a_stylesheet_document := a_document
			node_factory := a_node_factory
			if target_name_pool = Void then
				target_name_pool := default_pool.default_pool
			end
			todo ("create_style_sheet_executable - literal result stylesheet facility", True)
			a_stylesheet ?= a_stylesheet_document.document_element
			if a_stylesheet = Void then
				todo ("Top-level element of stylesheet is not xsl:stylesheet or xsl:transform or literal result element", True)
			elseif not a_stylesheet.is_error then

				-- Preprocess the stylesheet, performing validation and preparing template  definitions
				
				a_stylesheet.set_prepared_stylesheet (Current)
				a_stylesheet.preprocess

				-- Compile the stylesheet, retaining the resulting  executable

				--a_stylesheet.compile (compile_to_eiffel)
				if a_stylesheet.is_error then
					todo ("create_style_sheet_executable - compile failed", True)
				else
					--executable ?= a_stylesheet.last_generated_instruction
					check
					--	instruction_is_executable: executable /= Void
						-- as {XM_XSLT_STYLESHEET}.compile produces an
						-- executable if no error.
						end
					--executable.set_configuration (configuration)
				end
			end
		ensure
			node_factory_set: node_factory = a_node_factory
		end
		
invariant
	
	configuration_not_void: configuration /= Void
	stylesheet_module_load_suceeded: not load_stylesheet_module_failed implies load_stylesheet_module_error = Void -- and then last_loaded_module /= Void

end
