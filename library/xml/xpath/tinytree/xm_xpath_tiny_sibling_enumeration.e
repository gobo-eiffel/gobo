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

	KL_SHARED_STANDARD_FILES

creation

	make
	
feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_DOCUMENT; a_starting_node: XM_XPATH_TINY_NODE; a_node_test: XM_XPATH_NODE_TEST; children: BOOLEAN) is
			-- Establish invariant
		require
			document_not_void: a_document /= Void
			starting_node_not_void: a_starting_node /= Void
		do
			document := a_document
			starting_node := a_starting_node
			node_test := a_node_test
			debug ("XPath tiny sibling enumeration")
				std.error.put_string ("Node test fingerprint is ")
				std.error.put_string (node_test.fingerprint.out)
				std.error.put_new_line
			end
			get_children := children

			if get_children then -- child:: axis
				debug ("XPath tiny sibling enumeration")
					std.error.put_string ("Child axis%N")
				end
				parent_node := starting_node 
				-- move to first child
				next_node_number := starting_node.node_number + 1
			else -- following-sibling axis
				debug ("XPath tiny sibling enumeration")
					std.error.put_string ("Following-sibling axis%N")
				end
				parent_node := starting_node.parent
				-- move to next sibling
				next_node_number := document.retrieve_next_sibling (starting_node.node_number)
				debug ("XPath tiny sibling enumeration")
					std.error.put_string ("Starting node number is ")
					std.error.put_string (starting_node.node_number.out)
					std.error.put_string (", and it's next sibling is  ")
					std.error.put_string (next_node_number.out)
					std.error.put_new_line
				end
				if next_node_number < starting_node.node_number then -- owner pointer
					next_node_number := -1
				end
			end

			-- check if this matches the conditions

			if next_node_number > 0 and then node_test /= Void then
				debug ("XPath tiny sibling enumeration")
					std.error.put_string ("Node test present%N")
				end
				if not node_test.matches_node (a_document.retrieve_node_kind (next_node_number), a_document.name_code_for_node (next_node_number), a_document.element_annotation (next_node_number)) then
					debug ("XPath tiny sibling enumeration")
						std.error.put_string ("Need to advance%N")
					end
					need_to_advance := True
				end
			end
			debug ("XPath tiny sibling enumeration")
				std.error.put_string ("Next node number is ")
				std.error.put_string (next_node_number.out)
				std.error.put_new_line
			end
		ensure
			document_set: document = a_document
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
			get_children: get_children = children
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			if need_to_advance then advance end
			index := index + 1
			debug ("XPath tiny sibling enumeration")
				std.error.put_string ("{XM_XPATH_TINY_SIBLING_ENUMERATION}.forth: next node number is ")
				std.error.put_string (next_node_number.out)
				std.error.put_new_line
			end			
			if document.is_node_number_valid (next_node_number) then
				current_item := document.retrieve_node (next_node_number)
			else
				current_item := Void
			end
			need_to_advance := True
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (document, starting_node, node_test, get_children)
		end
	
feature {NONE} -- Implementation

	document: XM_XPATH_TINY_DOCUMENT
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	parent_node: XM_XPATH_TINY_NODE
			-- The parent node
	
	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	get_children: BOOLEAN
			-- Do we enumerate the child axis, or the following sibling axis?

	need_to_advance: BOOLEAN
			-- Do we need to advance
	
	next_node_number: INTEGER
			-- The next node to be returned by the enumeration
	
	advance is
			-- Adjust internal pointers
		require else
			need_to_advance: need_to_advance
		local
			finished: BOOLEAN
			this_node: INTEGER
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
			if next_node_number < this_node then -- We have found an owner pointer
				next_node_number := -1
			end
		ensure then
			no_need_to_advance: need_to_advance = False
		end
	
invariant

	document_not_void: document /= Void
	starting_node_not_void: starting_node /= Void
	
end
	
