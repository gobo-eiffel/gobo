note

	description:

		"Objects that enumerate the following:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_FOLLOWING_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TREE_NODE]
		redefine
			start, as_node_iterator
		end

	XM_XPATH_TREE_ENUMERATION

	XM_XPATH_TYPE
		export {NONE} all end

create

	make
	
feature {NONE} -- Initialization

	make (a_starting_node: XM_XPATH_TREE_NODE; a_node_test: XM_XPATH_NODE_TEST) is
			-- Establish invariant
		require
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		local
			a_tree_node: XM_XPATH_TREE_NODE
			a_node: XM_XPATH_NODE
		do
			make_enumeration (a_starting_node, a_node_test)
			check
				root_not_void: starting_node.document_root /= Void and then starting_node.document_root.is_document
			end
			root := starting_node.document_root.as_tree_node.as_tree_document
			if a_starting_node.node_type = Attribute_node then
				next_node := starting_node.parent.next_node_in_document_order (root)
			else
				from
					a_tree_node := a_starting_node
				until
					next_node /= Void or else a_tree_node = Void
				loop
					a_node := a_tree_node.next_sibling
					if a_node = Void then
						a_tree_node := a_tree_node.parent
					else
						next_node := a_node.as_tree_node
					end
				end
			end
			from
			until
				is_conforming (next_node)
			loop
				advance_one_step
			end

		ensure
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Does `Current' yield a node_sequence?	
		local
			a_tree_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TREE_NODE]
		do
			a_tree_node_iterator ?= ANY_.to_any (Current)
			Result := a_tree_node_iterator
		end

feature -- Cursor movement

	start is
			-- Move to next position
		do
			index := 1
			current_item := next_node
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			advance
			current_item := next_node
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (starting_node, node_test)
		end

feature {NONE} -- Implmenentation

	root: XM_XPATH_TREE_DOCUMENT
			-- Root of examined document tree

	advance_one_step is
			-- Move to the next candidate node
		do
			next_node := next_node.next_node_in_document_order (root)
		end

end
	
