note

	description:

		"Objects that enumerate the preceding-sibling:: Axis"

	library: "Gobo Eiffel XPATH Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_PRECEDING_SIBLING_ENUMERATION

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]
		redefine
			as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; a_starting_node: XM_XPATH_TINY_NODE; a_node_test: XM_XPATH_NODE_TEST)
			-- Establish invariant
		require
			document_not_void: a_document /= Void
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		do
			document := a_document
			document.ensure_prior_index
			starting_node := a_starting_node
			node_test := a_node_test
			next_node_number := a_starting_node.node_number
			parent_node := starting_node.parent
		ensure
			document_set: document = a_document
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		local
			a_tiny_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TINY_NODE]
		do
			a_tiny_node_iterator ?= ANY_.to_any (Current)
			Result := a_tiny_node_iterator
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			advance
			if document.is_node_number_valid (next_node_number) then
				current_item := document.retrieve_node (next_node_number)
				current_item.set_parent_node (parent_node) -- caching the parent node, so a future search need not be done
			else
				current_item := Void
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (document, starting_node, node_test)
		end

feature {NONE} -- Implementation

	document: XM_XPATH_TINY_FOREST
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	parent_node: XM_XPATH_TINY_COMPOSITE_NODE
			-- The parent node

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	next_node_number: INTEGER
			-- The next node to be returned by the enumeration

	advance
			-- Move to the next matching node
		local
			finished: BOOLEAN
		do
			from
			until
				finished
			loop
				next_node_number := document.prior_node (next_node_number)
				if next_node_number < 1
					or else node_test.matches_node(document.retrieve_node_kind (next_node_number), document.name_code_for_node (next_node_number), document.element_annotation (next_node_number)) then
					finished := True
				end
			end
		end

invariant

	document_not_void: document /= Void
	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void

end

