indexing

	description:

		"Objects that enumerate the preceding:: Axis"

	library: "Gobo Eiffel XPATH Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_PRECEDING_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]

		-- This class also implements an extra Axis, preceding-or-ancestor,
		-- which is used internally by xsl:number level="any"
	
creation

	make
	
feature -- Initialization

	make (doc: XM_XPATH_TINY_DOCUMENT; start: XM_XPATH_TINY_NODE; test: XM_XSLT_NODE_TEST; ancestors: BOOLEAN) is
			-- Establish invariant
		require
			document_not_void: doc /= Void
			starting_node_not_void: start /= Void
			node_test_not_void: test /= Void
		do
			document := doc
			starting_node := start
			node_test := test
			next_node_number := start.node_number
			include_ancestors := ancestors

			next_ancestor_depth := doc.depth_of (next_node_number) - 1
			debug ("XPath preceding enumeration")
				print ("Starting node number is ")
				print (next_node_number)
				print ("%NNext ancestor's depth is ")
				print (next_ancestor_depth.out)
			end
			advance
			debug ("XPath preceding enumeration")
				print ("%Nprior to calling forth, next node number is ")
				print (next_node_number)
				print ("%N")
			end	
		ensure
			document_set: document = doc
			starting_node_set: starting_node = start
			test_set: node_test = test
			include_ancestors: include_ancestors = ancestors
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
			create Result.make (document, starting_node, node_test, include_ancestors)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			current_item := document.retrieve_node (next_node_number)
			advance
		end
	
feature {NONE} -- Implementation

	document: XM_XPATH_TINY_DOCUMENT
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	node_test: XM_XSLT_NODE_TEST
			-- The node test to apply when selecting nodes

	include_ancestors: BOOLEAN
			-- Do we include ancestors in the enumeration

	next_node_number: INTEGER
			-- The next node to be returned by the enumeration

	next_ancestor_depth: INTEGER
	
	advance is
			-- Move to the next matching node
		local
			finished: BOOLEAN
		do
			from
			until
				finished
			loop
				next_node_number := next_node_number - 1
				debug ("XPath preceding enumeration")
					print ("Next node number is now ")
					print (next_node_number)
					print ("%N")
				end
				if not include_ancestors then
				-- skip over ancestors
					from
					until
						next_node_number <= 1 or else document.depth_of (next_node_number) /= next_ancestor_depth
					loop
						debug ("XPath preceding enumeration")
							print ("Next node depth is now ")
							print (document.depth_of (next_node_number))
							print ("%N")
							print ("Next ancestor depth is now ")
							print (next_ancestor_depth)
							print ("%N")							
						end
						next_ancestor_depth := next_ancestor_depth - 1
						next_node_number := next_node_number - 1
					end
				end
				if next_node_number <= 1
					or else node_test.matches_node (document.retrieve_node_kind (next_node_number), document.name_code_for_node (next_node_number), document.element_annotation (next_node_number)) then
					finished := True
				end
			end
		end
	
invariant

	document_not_void: document /= Void
	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void
	
end
	
