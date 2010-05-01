note

	description:

		"Objects that enumerate the attribute:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ATTRIBUTE_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_ATTRIBUTE]
		redefine
			as_node_iterator
		end

	XM_XPATH_TYPE

create

	make
	
feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; an_element: INTEGER; a_node_test: XM_XPATH_NODE_TEST) is
			-- Establish invariant
		require
			document_not_void: a_document /= Void
			valid_element: a_document.is_node_number_valid (an_element)
			node_test_not_void: a_node_test /= Void
		do
			document := a_document
			parent_element := an_element
			node_test := a_node_test

			attribute_index := a_document.alpha_value (an_element) -- first_attribute
			index := 0
		ensure
			document_set: document = a_document
			element_set: parent_element = an_element
			test_set: node_test = a_node_test
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		local
			a_tiny_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TINY_ATTRIBUTE]
		do
			a_tiny_node_iterator ?= ANY_.to_any (Current)
			Result := a_tiny_node_iterator
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			a_node: INTEGER
		do
			if attribute_index = -1 then
				current_item := Void
				index := index + 1
			else
				advance
				index := index + 1
				if attribute_index = -1 then
					current_item := Void
				else
					a_node := attribute_index
					attribute_index := attribute_index + 1
					if node_test.is_name_test then
						attribute_index := -1 -- there can only be one match, so abandon further searching
					end
					if document.is_attribute_number_valid (a_node) then current_item := document.retrieve_attribute_node (a_node) end
				end
			end
		end
	
feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (document, parent_element, node_test)
		end

feature {NONE} -- Implementation

	document: XM_XPATH_TINY_FOREST
			-- The document within which we enumerate

	parent_element: INTEGER
			-- The node number for the owning element

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	attribute_index: INTEGER
			-- Index of an attribute within `document'

	advance is
			-- Move to the next matching node
		local
			finished: BOOLEAN
		do
			from
			until
				finished
			loop
				if not document.is_attribute_number_valid (attribute_index) or else document.attribute_parent (attribute_index) /= parent_element then
					attribute_index := -1
					finished := True
				elseif  document.is_attribute_number_valid (attribute_index) and then node_test.matches_node (Attribute_node, document.attribute_name_code (attribute_index), document.attribute_annotation (attribute_index)) then
					finished := True
				else
					attribute_index := attribute_index + 1
					if not document.is_attribute_number_valid (attribute_index) then finished := True end
				end
			end
		end
	
invariant

	document_not_void: document /= Void
	strictly_positive_parent_element: parent_element > 0
	node_test_not_void: node_test /= Void
	
end
	
