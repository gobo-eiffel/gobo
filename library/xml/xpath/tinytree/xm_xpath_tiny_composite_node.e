indexing

	description:

		"Tiny tree composite nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TINY_COMPOSITE_NODE

inherit

	XM_XPATH_COMPOSITE_NODE
		undefine
			has_child_nodes
		end

	XM_XPATH_TINY_NODE
		undefine
			first_child, last_child
		redefine
			has_child_nodes
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	string_value: STRING is
			-- String-value
		local
			a_level, a_next_node, a_start_position, a_length: INTEGER
			a_buffer: STRING
		do
			-- Return the concatentation of the string value of all it's
			-- text-node descendants.
			-- Actually, more complicated than the above description.

			a_level := document.depth_of (node_number)
			
			-- note, we can't rely on the value being contiguously stored because of whitespace
			-- nodes: the data for these may still be present
			-- Also there may be processing-instruction and comment nodes present.

			from
				a_next_node := node_number + 1
			until
				a_next_node >= document.last_node_added or else document.depth_of (a_next_node) <= a_level
			loop
				a_length := document.beta_value (a_next_node)
				a_start_position := document.alpha_value (a_next_node)
				if document.retrieve_node_kind (a_next_node) = Text_node then
					if a_buffer = Void then
						a_buffer := document.character_buffer.substring (a_start_position + 1, a_start_position + a_length)
					else
						a_buffer := STRING_.appended_substring (a_buffer, document.character_buffer, a_start_position + 1,  a_start_position + a_length)
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
			Result := node_number + 1 < document.last_node_added
				and then document.depth_of (node_number + 1) > document.depth_of (node_number)
		end

end
	
