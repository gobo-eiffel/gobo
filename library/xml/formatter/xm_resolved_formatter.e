indexing

	description:

		"Formatter that displays resolved namespaces for debugging (not valid XML)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_RESOLVED_FORMATTER

inherit

	XM_FORMATTER
		redefine
			process_named_element,
			process_named_attribute,
			process_root_start_tag
		end
		
creation

	make
	
feature {NONE} -- Implementation

	process_named_element (a_node: XM_ELEMENT) is
			-- Process named node `a_node'.
		do
			process_named (a_node)
		end
		
	process_named_attribute (a_node: XM_ATTRIBUTE) is
			-- Process named node `a_node'.
		do
			process_named (a_node)
		end

	process_named (a_node: XM_NAMED_NODE) is
			-- Process named node: display resolved namespace 
			-- URI before name.
		require
			a_node_not_void: a_node /= Void
		do
			if a_node.namespace.uri.count > 0 then
				append (a_node.namespace.uri)
				append (Prefix_separator)
			end
			append (a_node.name)
		end

	process_root_start_tag  (an_element: XM_ELEMENT) is
			-- Treat start tag as an ordinary tag.
		do
			create root_namespace.make (Void, an_element.namespace.uri)
			process_start_tag (an_element)
		end
		
end
