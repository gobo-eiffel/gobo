indexing

	description:

		"Xace XML preprocessor"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_PREPROCESSOR

inherit

	ANY -- Export ANY's features

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_variables: like variables) is
			-- Create a new Xace XML preprocessor.
			-- Use `a_variable' for variable expansion
			-- Use `a_variable' to decide whether "if" and "unless"
			-- elements will be stripped off or not.
		require
			a_variables_not_void: a_variables /= Void
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

feature -- Access

	variables: ET_XACE_VARIABLES
			-- Dollar variables defined

feature -- Preprocessing

	preprocess_composite (a_composite: XM_COMPOSITE) is
			-- Expand variables in all attributes from `a_composite' and strip elements if they 
			-- have "if" or "unless" attributes which
			-- do not evaluate to `True'.
		require
			a_composite_not_void: a_composite /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child_element: XM_ELEMENT
			should_remove: BOOLEAN
		do
			a_cursor := a_composite.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				should_remove := False
				a_child_element ?= a_cursor.item
				if 
					a_child_element /= Void
				then
					expand_attribute_variables (a_child_element)
					if 
						should_strip_element (a_child_element)
					then
						should_remove := True
					else
						preprocess_composite (a_child_element)
					end
				end
				if
					should_remove
				then
					a_composite.remove_at_cursor (a_cursor)
				else
					a_cursor.forth
				end
			end
		end
	
feature {NONE} -- Implementation
	
	should_strip_element (an_element: XM_ELEMENT): BOOLEAN is
			-- Returns `True' if `an_element' contains a "if" of 
			-- "unless" attribtue which evaluates to `False'.
		require
			an_element_not_void: an_element /= Void
		do
			if 
				an_element.has_attribute_by_name (uc_if)
			then
				Result := not expression_result (an_element.attribute_by_name (uc_if).value)
			end
			
			if 
				an_element.has_attribute_by_name (uc_unless)
			then
				Result := expression_result (an_element.attribute_by_name (uc_unless).value)
			end
		end
	
	
	expression_result (a_string: UC_STRING): BOOLEAN is
			-- evaluates `a_string' and returns it's result.
		require
			a_string_not_void: a_string /= Void
		local
			a_left_side: UC_STRING
			a_right_side: UC_STRING
			equal_index: INTEGER
		do
			if 
				a_string.occurrences (uc_equal.item) > 0
			then
				equal_index := a_string.index_of (uc_equal.item, 1)
				a_left_side := a_string.substring (1, equal_index - 1)
				if 
					a_string.count > equal_index
				then
					a_right_side := a_string.substring (equal_index + 1, a_string.count)
				else
					!! a_right_side.make (0)
				end
				Result := a_right_side.is_equal (a_left_side)
			else
				Result := variables.is_defined (a_string.to_utf8)
			end
		end
	
	expand_attribute_variables (a_composite: XM_COMPOSITE) is
			-- replace all variables with their values in in all 
			-- attributes of `an_element', looking up the 
			-- variable/value pairs in `variables'
		require
			a_composite_not_void: a_composite /= Void
		local
			an_attribute: XM_ATTRIBUTE
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			an_uc_string: UC_STRING
		do
			a_cursor := a_composite.new_cursor
			from
				a_cursor.start
			until
				a_cursor.off
			loop
				an_attribute ?= a_cursor.item
				if
					an_attribute /= Void
				then
					v := clone (an_attribute.value)
					!! an_uc_string.make_from_utf8 (variables.expanded_variables (an_attribute.value.to_utf8))
					an_attribute.set_value (an_uc_string)
				end
				a_cursor.forth
			end
		end

invariant

	variables_not_void: variables /= Void

end -- class ET_XACE_PREPROCESSOR
