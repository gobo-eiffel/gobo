indexing

	description:

		"Objects that enumerate the child:: and following-sibling:: Axes"

	library: "Gobo Eiffel XPATH Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_SIBLING_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]

creation

	make
	
feature -- Initialization

	make (doc: XM_XPATH_TINY_DOCUMENT; start: XM_XPATH_TINY_NODE; test: XM_XSLT_NODE_TEST; children: BOOLEAN) is
			-- Establish invariant
		require
			document_not_void: doc /= Void
			starting_node_not_void: start /= Void
		local
			depth: INTEGER
		do
			document := doc
			starting_node := start
			node_test := test
			get_children := children

			if get_children then -- child:: axis
				debug ("XPath tiny sibling enumeration")
					print ("Child axis%N")
				end
				parent_node := starting_node 
				-- move to first child
				next_node_number := starting_node.node_number + 1
			else -- following-sibling axis
				debug ("XPath tiny sibling enumeration")
					print ("Following-sibling axis%N")
				end
				parent_node := starting_node.parent
				-- move to next sibling
				next_node_number := document.retrieve_next_sibling (starting_node.node_number)
				debug ("XPath tiny sibling enumeration")
					print ("Starting node number is ")
					print (starting_node.node_number.out)
					print (", and it's next sibling is  ")
					print (next_node_number.out)
					print ("%N")
				end
				if next_node_number < starting_node.node_number then -- owner pointer
					next_node_number := -1
				end
			end

			-- check if this matches the conditions

			if next_node_number > 0 and then node_test /= Void then
				debug ("XPath tiny sibling enumeration")
					print ("Node test present%N")
				end
				if not node_test.matches_node (doc.retrieve_node_kind (next_node_number), doc.name_code_for_node (next_node_number), doc.element_annotation (next_node_number)) then
					debug ("XPath tiny sibling enumeration")
						print ("Need to advance%N")
					end
					need_to_advance := True
				end
			end
			debug ("XPath tiny sibling enumeration")
				print ("Next node number is ")
				print (next_node_number.out)
				print ("%N")
			end
		ensure
			document_set: document = doc
			starting_node_set: starting_node = start
			test_set: node_test = test
			get_children: get_children = children
		end

feature -- Status report

	
	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			if need_to_advance then
				advance
				if next_node_number < this_node then -- We have found an owner pointer
					next_node_number := -1
					Result := True
				else
					Result := False
				end
			else
				Result := next_node_number <= 0
			end
		ensure then
			no_need_to_advance: need_to_advance = False
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (document, starting_node, node_test, get_children)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			if need_to_advance then advance end
			index := index + 1
			current_item := document.retrieve_node (next_node_number)
			need_to_advance := True
		end
	
feature {NONE} -- Implemnentation

	document: XM_XPATH_TINY_DOCUMENT
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	parent_node: XM_XPATH_TINY_NODE
			-- The parent node
	
	node_test: XM_XSLT_NODE_TEST
			-- The node test to apply when selecting nodes

	get_children: BOOLEAN
			-- Do we enumerate the child axis, or the following sibling axis?

	need_to_advance: BOOLEAN
			-- Do we need to advance
	
	next_node_number: INTEGER
			-- The next node to be returned by the enumeration

	this_node: INTEGER
			-- used for communication between `advance' and `after'
	
	advance is
			-- Adjust internal pointers
		require
			need_to_advance: need_to_advance
		local
			finished: BOOLEAN
		do
			this_node := next_node_number
			if node_test = Void then
				next_node_number := document.retrieve_next_sibling (next_node_number)
			else
				from
				until
					finished
				loop
					next_node_number := document.retrieve_next_sibling (next_node_number)
					if next_node_number < this_node or else
						node_test.matches_node (document.retrieve_node_kind (next_node_number), document.name_code_for_node (next_node_number), document.element_annotation (next_node_number)) then
						finished := True
					end
				end
			end
			need_to_advance := False
		ensure
			no_need_to_advance: need_to_advance = False
		end
	
invariant

	document_not_void: document /= Void
	starting_node_not_void: starting_node /= Void
	
end
	
