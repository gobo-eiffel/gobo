indexing

	description:

		"Objects that enumerate the following:: Axis"

	library: "Gobo Eiffel XPATH Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_FOLLOWING_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]

creation

	make
	
feature -- Initialization

	make (doc: XM_XPATH_TINY_DOCUMENT; start: XM_XPATH_TINY_NODE; test: XM_XSLT_NODE_TEST; descendants: BOOLEAN) is
			-- Establish invariant
		require
			document_not_void: doc /= Void
			starting_node_not_void: start /= Void
			node_test_not_void: test /= Void
		local
			depth: INTEGER
			finished: BOOLEAN
		do
			document := doc
			starting_node := start
			node_test := test
			next_node_number := start.node_number
			include_descendants := descendants

			depth := doc.depth_of (next_node_number)

			-- Skip the descendants, if any
			
			if include_descendants then
				next_node_number := next_node_number + 1
			else
				from
				until
					finished
				loop
					next_node_number := next_node_number + 1
					if next_node_number > doc.last_node_added then
						next_node_number := -1
						finished := True
					elseif not (doc.depth_of (next_node_number) > depth) then
						finished := True
					end
				end
			end

			if not test.matches_node (doc.retrieve_node_kind (next_node_number), doc.name_code_for_node (next_node_number), doc.element_annotation (next_node_number)) then
				advance
			end
		ensure
			document_set: document = doc
			starting_node_set: starting_node = start
			test_set: node_test = test
			include_descendants: include_descendants = descendants
		end

feature -- Status report

	
	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := next_node_number <= 0
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (document, starting_node, node_test, include_descendants)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			current_item := document.retrieve_node (next_node_number)
			advance
		end
	
feature {NONE} -- Implemnentation

	document: XM_XPATH_TINY_DOCUMENT
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	node_test: XM_XSLT_NODE_TEST
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
	
