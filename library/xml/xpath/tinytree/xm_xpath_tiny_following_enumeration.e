indexing

	description:

		"Objects that enumerate the following:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_FOLLOWING_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]
		redefine
			start, as_node_iterator
		end

create

	make
	
feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; a_starting_node: XM_XPATH_TINY_NODE; a_node_test: XM_XPATH_NODE_TEST; descendants: BOOLEAN) is
			-- Establish invariant
		require
			document_not_void: a_document /= Void
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		local
			a_depth: INTEGER
			finished: BOOLEAN
		do
			document := a_document
			starting_node := a_starting_node
			node_test := a_node_test
			next_node_number := a_starting_node.node_number
			include_descendants := descendants

			a_depth := a_document.depth_of (next_node_number)

			-- Skip the descendants, if any
			
			if include_descendants then
				next_node_number := next_node_number + 1
			else
				from
				until
					finished
				loop
					next_node_number := next_node_number + 1
					if next_node_number > a_document.last_node_added then
						next_node_number := -1
						finished := True
					elseif not (a_document.depth_of (next_node_number) > a_depth) then
						finished := True
					end
				end
			end

			if not a_node_test.matches_node (a_document.retrieve_node_kind (next_node_number), a_document.name_code_for_node (next_node_number), a_document.element_annotation (next_node_number)) then
				advance
			end
		ensure
			document_set: document = a_document
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
			include_descendants: include_descendants = descendants
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator	
		local
			a_tiny_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TINY_NODE]
		do
			a_tiny_node_iterator ?= ANY_.to_any (Current)
			Result := a_tiny_node_iterator
		end

feature -- Cursor movement

		start is
			-- Move to next position
		do
			index := 1
			if document.is_node_number_valid (next_node_number) then
				current_item := document.retrieve_node (next_node_number)
			else
				current_item := Void
			end
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			advance
			if document.is_node_number_valid (next_node_number) then
				current_item := document.retrieve_node (next_node_number)
			else
				current_item := Void
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (document, starting_node, node_test, include_descendants)
		end
	
feature {NONE} -- Implemnentation

	document: XM_XPATH_TINY_FOREST
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	include_descendants: BOOLEAN
			-- Do we include descendants in the enumeration

	next_node_number: INTEGER
			-- The next node to be returned by the enumeration

	advance is
			-- Move to the next matching node
		local
			finished: BOOLEAN
		do
			from
			until
				finished 
			loop
				next_node_number := next_node_number + 1
				if next_node_number > document.last_node_added then
					next_node_number := -1
					finished := True
				elseif node_test.matches_node (document.retrieve_node_kind (next_node_number), document.name_code_for_node (next_node_number), document.element_annotation (next_node_number)) then
					finished := True
				end
			end
		end
	
invariant

	document_not_void: document /= Void
	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void
	
end
	
