indexing

	description:

		"Objects that enumerate the attribute:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_ATTRIBUTE_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TREE_ATTRIBUTE]
			
	XM_XPATH_TYPE

creation

	make
	
feature {NONE} -- Initialization

	make (an_element: XM_XPATH_TREE_ELEMENT; a_node_test: XM_XPATH_NODE_TEST) is
			-- Establish invariant
		require
			element_not_void: an_element /= Void
			node_test_not_void: a_node_test /= Void
		do
			parent_element := an_element
			node_test := a_node_test
			index := 0
			attribute_index := 0
		ensure
			element_set: parent_element = an_element
			test_set: node_test = a_node_test
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			a_name_test: XM_XPATH_NAME_TEST
		do
			if attribute_index = -1 then
				current_item := Void
				index := index + 1
			else			
				advance
				index := index + 1
				if parent_element.is_attribute_index_valid (attribute_index) then
					create current_item.make (parent_element.document, parent_element, attribute_index)
				else
					current_item := Void
				end
				a_name_test ?= node_test
				if a_name_test /= Void then
					attribute_index := -1 -- there can only be one match, so abandon further searching
				end
			end
		end
	
feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (parent_element, node_test)
		end

feature {NONE} -- Implementation

	parent_element: XM_XPATH_TREE_ELEMENT
			-- The owning element

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	attribute_index: INTEGER
			-- Index of an attribute within `parent_element'

	advance is
			-- Move to the next matching node
		local
			finished: BOOLEAN
		do
			from
			until
				finished
			loop
				attribute_index := attribute_index + 1
				if not parent_element.is_attribute_index_valid (attribute_index) then
					attribute_index := -1
					finished := True
				elseif  node_test.matches_node (Attribute_node, parent_element.attribute_name_code (attribute_index), parent_element.attribute_type_code (attribute_index)) then
					finished := True
				end
			end
		end
	
end
	
