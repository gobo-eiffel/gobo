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

	XM_XPATH_TINY_NODE
		redefine
			has_child_nodes
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	has_child_nodes: BOOLEAN is
			-- Does `Current' have any children?
		do
			Result := node_number + 1 < document.last_node_added
				and then document.depth_of (node_number + 1) > document.depth_of (node_number)
		end

	string_value: STRING is
			-- String-value
		local
			level, next, start, length: INTEGER
			buffer: STRING
		do
			-- Return the concatentation of the string value of all it's
			-- text-node descendants.
			-- Actually, more complicated than the above description.

			level := document.depth_of (node_number)
			
			-- note, we can't rely on the value being contiguously stored because of whitespace
			-- nodes: the data for these may still be present
			-- Also there may be processing-instruction and comment nodes present.

			from
				next := node_number + 1
			until
				next >= document.last_node_added or else document.depth_of (next) <= level
			loop
				if document.retrieve_node_kind (next) = Text_node then
					if buffer = Void then
						create {UC_UTF8_STRING} buffer.make_empty
					end
					length := document.beta_value (next)
					start := document.alpha_value (next)
					buffer := STRING_.appended_string (buffer, document.character_buffer.substring (start, start + length))
				end
				next := next + 1
			end
			if buffer = Void then
				Result := ""
			else
				Result := buffer
			end
		end


end
	
