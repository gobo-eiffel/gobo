indexing

	description:

		"Objects that implement gexslt:collection"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GEXSLT_COLLECTION

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, is_gexslt_collection
		end

	XM_XPATH_ISOLATION_LEVELS

	-- This class implements a child of the gexslt:isolation-levels User-defined Data Element
	--   in the gexslt extensions namespace, whose purpose is to establish isolation levels
	--   for fn:collection.

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	href: STRING
			-- Value of href attribute
	
	isolation_level_attribute_value: STRING
			-- Value of isolation-level attribute

	is_gexslt_collection: BOOLEAN is
			-- Is `Current' a gexslt:collection?
		do
			Result := True
		end

feature -- Status report

	isolation_level: INTEGER is
			-- Isolation-level matching `href'?
		require
			validation_complete: validated
			no_compile_erros: not any_compile_errors
		do
			Result :=  parsed_isolation_level
		ensure
			valid_isolation_level: Result >= Read_uncommitted and Result <= Serializable
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, an_isolation_level: STRING
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Href_attribute) then
					href := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (href);STRING_.right_adjust (href);
				elseif STRING_.same_string (an_expanded_name, Isolation_level_attribute) then
					isolation_level_attribute_value := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (isolation_level_attribute_value);STRING_.right_adjust (isolation_level_attribute_value);
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if href = Void then report_absence ("href") end
			if isolation_level_attribute_value = Void then report_absence ("isolation-level") end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			an_isolation_levels: XM_XSLT_GEXSLT_ISOLATION_LEVELS
			an_error: XM_XPATH_ERROR_VALUE
		do
			an_isolation_levels ?= parent
			if an_isolation_levels = Void then
				create an_error.make_from_string ("Gexslt:collection must be immediate child of gexslt:isolation-levels", Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			else
				if STRING_.same_string (isolation_level_attribute_value, "read-uncommitted") then
					parsed_isolation_level := Read_uncommitted
				elseif STRING_.same_string (isolation_level_attribute_value, "read-committed") then
					parsed_isolation_level := Read_committed
				elseif STRING_.same_string (isolation_level_attribute_value, "repeatable-read") then
					parsed_isolation_level := Repeatable_read
				elseif STRING_.same_string (isolation_level_attribute_value, "serializable") then
					parsed_isolation_level := Serializable
				else
					create an_error.make_from_string ("isolation-level attribute of gexslt:collection must be one of 'read-uncommitted', 'read-committed', 'repeatable-read' or 'serializable'",
																 Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if an_executable.has_collection_isolation_level (href) then
				if an_executable.collection_isolation_level (href) /= isolation_level then
					create an_error.make_from_string ("Conflicting definitions for isolation-level attribute of gexslt:collection",
																 Gexslt_eiffel_type_uri, "ISOLATION-LEVEL", Static_error)
					report_compile_error (an_error)
				end
			else
				an_executable.set_collection_isolation_level (isolation_level, href)
			end
			last_generated_expression := Void
		end

feature {NONE} -- Implementation

	parsed_isolation_level: INTEGER
			-- Parsed value for isolation-level

end
