note

	description:

		"Tiny tree Processing-instruction nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_PROCESSING_INSTRUCTION

inherit

	XM_XPATH_PROCESSING_INSTRUCTION
		undefine
			base_uri, is_tiny_node, as_tiny_node
		end

	XM_XPATH_TINY_NODE
		undefine
			typed_value
		redefine
			base_uri
		end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; a_node_number: INTEGER) is
		require
			valid_document: a_document /= Void
			valid_node_number: a_node_number > 1 and a_node_number <= a_document.last_node_added
		do
			tree := a_document
			node_number := a_node_number
			node_type := Processing_instruction_node
		ensure
			document_set: tree = a_document
			node_number_set: node_number = a_node_number
		end

feature -- Access

	string_value: STRING is
			-- String-value
		local
			start, length: INTEGER
		do
			length := tree.beta_value (node_number)
			start := tree.alpha_value (node_number)
			Result := tree.comment_buffer.substring (start, start + length - 1)
		end

	base_uri: STRING is
			-- Base URI
		local
			l_initial_system_id: STRING
			l_parent: XM_XPATH_COMPOSITE_NODE
		do
			l_initial_system_id := tree.system_id_for_node (node_number)
			l_parent := parent
			if l_parent = Void then
				Result := l_initial_system_id
			elseif
				STRING_.same_string (l_parent.system_id, l_initial_system_id) then
				Result := l_parent.base_uri
			else
				Result := l_initial_system_id
			end
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_processing_instruction (node_name, string_value, 0)
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end

end
