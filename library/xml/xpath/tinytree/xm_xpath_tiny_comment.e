note

	description:

		"Tiny tree Comment nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_COMMENT

inherit

	XM_XPATH_COMMENT
		undefine
			is_tiny_node, as_tiny_node
		end

	XM_XPATH_TINY_NODE
		undefine
			local_part, typed_value
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
			node_type := Comment_node
		ensure
			document_set: tree = a_document
			node_number_set: node_number = a_node_number
		end

feature -- Access

	string_value: STRING is
			-- String-value
		local
			an_index, a_length: INTEGER
		do
			an_index := tree.alpha_value (node_number)
			a_length  := tree.beta_value (node_number)
			Result := tree.comment_buffer.substring (an_index, an_index + a_length - 1)
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_comment (string_value, 0)
		end

feature {XM_XPATH_NODE} -- Resricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end

end
