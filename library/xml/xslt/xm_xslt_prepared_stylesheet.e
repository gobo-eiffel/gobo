indexing

	description:

		"Objects that represent a compiled stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PREPARED_STYLESHEET

feature -- Access

	executable: XM_XSLT_EXECUTABLE
			-- Executable form of the stylesheet

	last_loaded_module: XM_XPATH_DOCUMENT
			-- Last stylesheet module sucessfully loaded

feature -- Status report

	load_stylesheet_module_failed: BOOLEAN
			-- did last call to `load_stylesheet_module' fail?

	
	load_stylesheet_module_error: STRING
			-- Error reported by last call to `load_stylesheet_module'

	load_stylesheet_module (a_source: XM_XSLT_URI_SOURCE; a_configuration: XM_XSLT_CONFIGURATION; a_name_pool: XM_XPATH_NAME_POOL) is
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
			create a_tree_builder.make (a_name_pool)
			-- a_tree_builder.set_line_numbering (True)
			-- a_tree_builder.set_system_id (a_source.system_id)
			create a_stylesheet_stripper.make (a_name_pool, a_tree_builder)
			create a_comment_stripper.make (a_stylesheet_stripper)
			a_source.send (a_configuration, 	a_comment_stripper, a_name_pool, True)
			if a_source.is_error then
				load_stylesheet_module_failed := True
				load_stylesheet_module_error := a_source.error_message
			else
				last_loaded_module := a_tree_builder.document
			end
		end

invariant

	stylesheet_module_load_failed: load_stylesheet_module_failed implies load_stylesheet_module_error /= Void and then last_loaded_module = Void
	stylesheet_module_load_suceeded: not load_stylesheet_module_failed implies load_stylesheet_module_error = Void and then last_loaded_module /= Void
end

