note

	description:

		"Objects that implement gexslt:isolation-level"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_GEXSLT_ISOLATION_LEVEL

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

	XM_XPATH_ISOLATION_LEVELS
		export {NONE} all end

	-- This class implements a User-defined Data Element in the gexslt extensions
	--  namespace, whose purpose is to establish isolation levels for fn:doc and fn:collection.

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	isolation_level_attribute_value: detachable STRING
		-- Value of isolation-level attribute

feature -- Status report

	isolation_level: INTEGER
			-- Isolation-level
		require
			validation_complete: validated
			no_compile_erros: not any_compile_errors
		do
			Result :=  parsed_isolation_level
		ensure
			valid_isolation_level: Result >= Read_uncommitted and Result <= Serializable
		end

feature -- Element change


	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
			l_isolation_level_attribute_value: like isolation_level_attribute_value
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Isolation_level_attribute) then
						l_isolation_level_attribute_value := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_isolation_level_attribute_value)
						STRING_.right_adjust (l_isolation_level_attribute_value)
						isolation_level_attribute_value := l_isolation_level_attribute_value
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if isolation_level_attribute_value = Void then report_absence ("isolation-level") end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_error: XM_XPATH_ERROR_VALUE
			finished: BOOLEAN
		do
			check_top_level (Void)
			from
				a_child_iterator := new_axis_iterator (Child_axis); a_child_iterator.start
			until finished or else a_child_iterator.after loop
				if a_child_iterator.item.node_type = Text_node and then is_all_whitespace (a_child_iterator.item.string_value) then
					-- do nothing, as xml:space="preserve" makes this legitimate
				else
					create an_error.make_from_string ("Only gexslt:isolation-level may not have child nodes", Xpath_errors_uri, "XTSE0010", Static_error)
					report_compile_error (an_error); finished := True
				end
				a_child_iterator.forth
			end
			check attached isolation_level_attribute_value as l_isolation_level_attribute_value then
				if STRING_.same_string (l_isolation_level_attribute_value, "read-uncommitted") then
					parsed_isolation_level := Read_uncommitted
				elseif STRING_.same_string (l_isolation_level_attribute_value, "read-committed") then
					parsed_isolation_level := Read_committed
				elseif STRING_.same_string (l_isolation_level_attribute_value, "repeatable-read") then
					parsed_isolation_level := Repeatable_read
				elseif STRING_.same_string (l_isolation_level_attribute_value, "serializable") then
					parsed_isolation_level := Serializable
				else
					create an_error.make_from_string ("isolation-level attribute of gexslt:document must be one of 'read-uncommitted', 'read-committed', 'repeatable-read' or 'serializable'",
																 Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			if principal_stylesheet = containing_stylesheet then
				an_executable.set_isolation_level (isolation_level)
			end
			last_generated_expression := Void
		end

feature {NONE} -- Implementation

	parsed_isolation_level: INTEGER
			-- Parsed value of `isolation_level_attribute_value'

end
