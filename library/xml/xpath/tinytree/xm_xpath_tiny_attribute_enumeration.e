indexing

	description:

		"Objects that enumerate the attribute:: Axis"

	library: "Gobo Eiffel XPATH Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ATTRIBUTE_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_ATTRIBUTE]

	XM_XPATH_TYPE

creation

	make
	
feature -- Initialization

	make (doc: XM_XPATH_TINY_DOCUMENT; element: INTEGER; test: XM_XSLT_NODE_TEST) is
			-- Establish invariant
		require
			document_not_void: doc /= Void
			valid_element: doc.is_node_number_valid (element)
			node_test_not_void: test /= Void
		do
			document := doc
			parent_element := element
			node_test := test

			attribute_index := doc.alpha_value (element) -- first_attribute
			index := 0
			advance
		ensure
			document_set: document = doc
			element_set: parent_element = element
			test_set: node_test = test
		end

feature -- Status report

	
	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := attribute_index <= 0
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (document, parent_element, node_test)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			a_node: INTEGER
			name_test: XM_XSLT_NAME_TEST
		do
			index := index + 1
			a_node := attribute_index
			attribute_index := attribute_index + 1
			name_test ?= node_test
			if name_test /= Void then
				attribute_index := -1 -- there can only be one match, so abandon further searching
			else
				advance
			end
			current_item := document.retrieve_attribute_node (a_node) 
		end
	
feature {NONE} -- Implemnentation

	document: XM_XPATH_TINY_DOCUMENT
			-- The document within which we enumerate

	parent_element: INTEGER
			-- The node number for the owning element

	node_test: XM_XSLT_NODE_TEST
			-- The node test to apply when selecting nodes
			-- Do we include ourself in the enumeration

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
				if attribute_index > document.number_of_attributes or else document.attribute_parent (attribute_index) /= parent_element then
					attribute_index := -1
					finished := True
				elseif node_test.matches_node (Attribute_node, document.attribute_name_code (attribute_index), document.attribute_annotation (attribute_index)) then
					finished := True
				else
					attribute_index := attribute_index + 1
				end
			end
		end
	
invariant

	document_not_void: document /= Void
	parent_element_not_void: parent_element /= Void
	node_test_not_void: node_test /= Void
	
end
	
