note

	description:

		"Helper objects for enumerating XPath axes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_TREE_ENUMERATION

feature {NONE} -- Initialization

	make_enumeration (a_starting_node: XM_XPATH_TREE_NODE; a_node_test: XM_XPATH_NODE_TEST)
			-- Establish invariant
		require
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		do
			starting_node := a_starting_node
			node_test := a_node_test
		ensure
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
		end

feature {NONE} -- Implmenentation

	starting_node: XM_XPATH_TREE_NODE
			-- The starting node for the enumeration

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	next_node: detachable like starting_node
			-- The first/next node to be returned by the enumeration

	advance
			-- Move to the next matching node
		do
			from
				if next_node /= Void then advance_one_step end
			until
				is_conforming (next_node)
			loop
				advance_one_step
			end
		end

	advance_one_step
			-- Move to the next candidate node
		require
			next_node_not_void: next_node /= Void
		deferred
		end

	is_conforming (a_node: detachable like starting_node): BOOLEAN
			-- Does `a_node' conform to `node_test', or is it `Void'?
		do
			if a_node = Void then
				Result := True
			else
				Result := node_test.matches_node (a_node.node_type, a_node.fingerprint, a_node.type_annotation)
			end
		end

invariant

	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void

end

