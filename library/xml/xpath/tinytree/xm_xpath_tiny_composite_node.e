note

	description:

		"Tiny tree composite nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TINY_COMPOSITE_NODE

inherit

	XM_XPATH_COMPOSITE_NODE
		undefine
			has_child_nodes, is_tiny_node, as_tiny_node
		end

	XM_XPATH_TINY_NODE
		undefine
			first_child, last_child, is_tiny_composite_node, as_tiny_composite_node
		redefine
			has_child_nodes
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	is_tiny_composite_node: BOOLEAN is
			-- Is `Current' a composite node?
		do
			Result := True
		end

	as_tiny_composite_node: XM_XPATH_TINY_COMPOSITE_NODE is
			-- `Current' seen as a composite node
		do
			Result := Current
		end

	string_value: STRING is
			-- String-value
		local
			a_level, a_next_node, a_start_position, a_length: INTEGER
			a_buffer: STRING
		do
			-- Return the concatentation of the string value of all it's
			-- text-node descendants.
			-- Actually, more complicated than the above description.

			a_level := tree.depth_of (node_number)
			
			-- Note, we can't rely on the value being contiguously stored because of whitespace
			-- nodes: the data for these may still be present
			-- Also there may be processing-instruction and comment nodes present.

			from
				a_next_node := node_number + 1
			until
				a_next_node > tree.last_node_added or else tree.depth_of (a_next_node) <= a_level
			loop
				if tree.retrieve_node_kind (a_next_node) = Text_node then
					a_length := tree.beta_value (a_next_node)
					a_start_position := tree.alpha_value (a_next_node)
					if a_buffer = Void then
						a_buffer := tree.character_buffer.substring (a_start_position + 1, a_start_position + a_length)
					else
						a_buffer := STRING_.appended_substring (a_buffer, tree.character_buffer, a_start_position + 1,  a_start_position + a_length)
					end
				end
				a_next_node := a_next_node + 1
			end
			if a_buffer = Void then
				Result := ""
			else
				Result := a_buffer
			end
		end

feature -- Status report

	has_child_nodes: BOOLEAN is
			-- Does `Current' have any children?
		do
			Result := node_number  < tree.number_of_nodes
				and then tree.depth_of (node_number + 1) > tree.depth_of (node_number)
		end

end
	
